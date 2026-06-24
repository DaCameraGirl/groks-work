# Audits workspace, pushes git repos, and refreshes MANIFEST.json for workspace-backup.
param(
    [string]$WorkspaceRoot = "C:\Users\enter\OneDrive\Projects",
    [string]$BackupRepo = "C:\Users\enter\OneDrive\Projects\workspace-backup",
    [switch]$Push
)

$ErrorActionPreference = "Continue"
$neverGitHub = @(
    "API_KEYS",
    "Bank_Statement",
    "Claude_Resume",
    "CODEX_SESSIONS",
    "Reports_2022"
)

$rows = @()
$pushLog = @()

if (-not (Test-Path $WorkspaceRoot)) {
    Write-Error "Workspace root not found: $WorkspaceRoot"
    exit 1
}

Get-ChildItem $WorkspaceRoot -Directory | Where-Object { $_.Name -ne "workspace-backup" } | ForEach-Object {
    $path = $_.FullName
    $name = $_.Name
    $hasGit = Test-Path (Join-Path $path ".git")
    $remote = $null
    $branch = $null
    $dirty = $null
    $ahead = $null
    $excluded = $name -in $neverGitHub
    $sizeMb = [math]::Round((Get-ChildItem $path -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 1)

    if ($hasGit) {
        Push-Location $path
        $remote = (git remote get-url origin 2>$null)
        $branch = (git branch --show-current 2>$null)
        $dirty = if ((git status --porcelain 2>$null).Length -gt 0) { $true } else { $false }
        if ($remote -and $Push -and -not $excluded) {
            git push -u origin $branch 2>&1 | Out-Null
            if ($LASTEXITCODE -eq 0) { $pushLog += "pushed: $name" } else { $pushLog += "push-failed: $name" }
        }
        Pop-Location
    }

    $backupStatus = if ($excluded) { "local-only" }
    elseif ($remote) { if ($dirty) { "github-dirty" } else { "github-synced" } }
    elseif ($hasGit) { "git-no-remote" }
    else { "needs-git" }

    $rows += [ordered]@{
        name = $name
        path = $path
        sizeMb = $sizeMb
        hasGit = $hasGit
        remote = $remote
        branch = $branch
        dirty = $dirty
        backupStatus = $backupStatus
        excluded = $excluded
    }
}

$manifest = [ordered]@{
    generatedAt = (Get-Date).ToString("o")
    workspaceRoot = $WorkspaceRoot
    projectCount = $rows.Count
    onGitHub = @($rows | Where-Object { $_.backupStatus -like "github*" }).Count
    needsAttention = @($rows | Where-Object { $_.backupStatus -in @("needs-git", "git-no-remote", "github-dirty") }).Count
    localOnly = @($rows | Where-Object { $_.excluded }).Count
    projects = $rows
}

$manifestPath = Join-Path $BackupRepo "MANIFEST.json"
if (Test-Path $BackupRepo) {
    $manifest | ConvertTo-Json -Depth 6 | Set-Content $manifestPath -Encoding utf8
    Write-Host "Wrote $manifestPath"
}

Write-Host "Projects: $($rows.Count) | On GitHub: $($manifest.onGitHub) | Needs attention: $($manifest.needsAttention) | Local-only: $($manifest.localOnly)"
if ($pushLog.Count) { $pushLog | ForEach-Object { Write-Host $_ } }

$rows | Where-Object { $_.backupStatus -ne "github-synced" -and -not $_.excluded } |
    Sort-Object backupStatus, name |
    Format-Table name, backupStatus, sizeMb, remote -AutoSize