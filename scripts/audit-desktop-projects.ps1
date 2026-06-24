# Scans workspace project folders for git remotes, size, and backup status.
$ErrorActionPreference = "SilentlyContinue"
$workspace = "C:\Users\enter\OneDrive\Projects"
$exclude = @('workspace-backup')
$rows = @()

Get-ChildItem $workspace -Directory | Where-Object { $_.Name -notin $exclude } | ForEach-Object {
    $path = $_.FullName
    $gitDir = Join-Path $path ".git"
    $hasGit = Test-Path $gitDir
    $remote = $null
    $branch = $null
    $dirty = $null
    $sizeMb = [math]::Round((Get-ChildItem $path -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 1)

    if ($hasGit) {
        Push-Location $path
        $remote = (git remote get-url origin 2>$null)
        $branch = (git branch --show-current 2>$null)
        $dirty = if ((git status --porcelain 2>$null).Length -gt 0) { "yes" } else { "no" }
        Pop-Location
    }

    $rows += [pscustomobject]@{
        Name = $_.Name
        Path = $path
        SizeMB = $sizeMb
        HasGit = $hasGit
        Remote = $remote
        Branch = $branch
        Dirty = $dirty
    }
}

$rows | Sort-Object Name | Format-Table -AutoSize
$out = Join-Path $workspace "workspace-backup\MANIFEST.json"
if (-not (Test-Path (Split-Path $out))) { $out = Join-Path ([Environment]::GetFolderPath("Desktop")) "_desktop-project-audit.json" }
$rows | ConvertTo-Json -Depth 3 | Set-Content $out -Encoding utf8
Write-Host "Saved audit to $out"
Write-Host "Total folders: $($rows.Count)"
Write-Host "With git: $(($rows | Where-Object HasGit).Count)"
Write-Host "Without git: $(($rows | Where-Object { -not $_.HasGit }).Count)"
Write-Host "No remote: $(($rows | Where-Object HasGit -and -not $_.Remote).Count)"