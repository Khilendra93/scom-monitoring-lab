param([int]$Threshold=80)
$os=Get-CimInstance Win32_OperatingSystem
$total=$os.TotalVisibleMemorySize/1MB
$free=$os.FreePhysicalMemory/1MB
$usedPct=[math]::Round((($total-$free)/$total)*100,2)
Write-Host "Memory Usage: $usedPct%"
if ($usedPct -ge $Threshold) { Write-Warning "Memory usage is above threshold." }
else { Write-Host "Memory usage is within threshold." -ForegroundColor Green }
