# Moves desktop project folders to OneDrive\Projects and updates shortcuts.
$ErrorActionPreference = "Continue"
$desktop = [Environment]::GetFolderPath("Desktop")
$projectsRoot = "C:\Users\enter\OneDrive\Projects"
$keepOnDesktop = @('_Launch Pad', '_Scratch Notes', '_Job Search', '_Images')
$log = Join-Path $desktop "_DESKTOP-CLEANUP-LOG.txt"

New-Item -ItemType Directory -Force -Path $projectsRoot | Out-Null

$moved = @()
Get-ChildItem $desktop -Directory | Where-Object { $_.Name -notin $keepOnDesktop } | ForEach-Object {
    $folderName = $_.Name
    $dest = Join-Path $projectsRoot $folderName
    if (Test-Path $dest) {
        Write-Warning "Skip $folderName - already exists in Projects"
        return
    }
    try {
        Move-Item $_.FullName $dest -ErrorAction Stop
        $moved += $folderName
        Add-Content $log "projects-move: $folderName -> $dest"
    } catch {
        Write-Warning "Could not move $folderName : $($_.Exception.Message)"
        Add-Content $log "projects-move-failed: $folderName"
    }
}

$oldRoot = "C:\Users\enter\OneDrive\Desktop"
$newRoot = $projectsRoot
$shell = New-Object -ComObject WScript.Shell
$fixed = 0

Get-ChildItem $desktop -File -Filter "*.lnk" | ForEach-Object {
    $lnk = $shell.CreateShortcut($_.FullName)
    $changed = $false
    foreach ($prop in @("TargetPath", "Arguments", "WorkingDirectory", "IconLocation")) {
        $val = $lnk.$prop
        if ($val -and $val -like "*$oldRoot*") {
            $lnk.$prop = $val.Replace($oldRoot, $newRoot)
            $changed = $true
        }
    }
    if ($changed) {
        $lnk.Save()
        $fixed += 1
        Add-Content $log "shortcut-fix: $($_.Name)"
    }
}

Write-Host "Moved $($moved.Count) folders to $projectsRoot"
Write-Host "Updated $fixed shortcuts"
$moved