param([int]$Threshold=80)
$cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$cpu = [math]::Round($cpu,2)
Write-Host "CPU Usage: $cpu%"
if ($cpu -ge $Threshold) { Write-Warning "CPU usage is above threshold." }
else { Write-Host "CPU usage is within threshold." -ForegroundColor Green }
