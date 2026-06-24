$shell = New-Object -ComObject WScript.Shell
$desktop = [Environment]::GetFolderPath("Desktop")
$rows = @()

Get-ChildItem $desktop -File | Where-Object { $_.Extension -eq '.lnk' } | ForEach-Object {
    $lnk = $shell.CreateShortcut($_.FullName)
    $target = $lnk.TargetPath
    $args = $lnk.Arguments
    $work = $lnk.WorkingDirectory
    $pointsToDesktop = ($target -like "*\Desktop\*") -or ($work -like "*\Desktop\*") -or ($args -like "*\Desktop\*")
    $rows += [pscustomobject]@{
        Shortcut = $_.Name
        Target = $target
        WorkingDirectory = $work
        PointsToDesktop = $pointsToDesktop
    }
}

$rows | Where-Object PointsToDesktop | Sort-Object Shortcut | Format-Table -AutoSize
Write-Host "Shortcuts pointing at Desktop paths: $(($rows | Where-Object PointsToDesktop).Count) / $($rows.Count)"