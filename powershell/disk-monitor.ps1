param([int]$Threshold=15)
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
foreach ($disk in $disks) {
    $freePct=[math]::Round(($disk.FreeSpace/$disk.Size)*100,2)
    $freeGB=[math]::Round($disk.FreeSpace/1GB,2)
    Write-Host "$($disk.DeviceID) Free: $freePct% ($freeGB GB)"
    if ($freePct -lt $Threshold) { Write-Warning "$($disk.DeviceID) is below threshold." }
}
