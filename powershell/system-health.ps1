Write-Host "===== SYSTEM HEALTH CHECK =====" -ForegroundColor Cyan
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host "Date: $(Get-Date)"
Write-Host ""

Write-Host "OS Information" -ForegroundColor Yellow
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, Version, OSArchitecture, LastBootUpTime |
    Format-List

Write-Host "CPU" -ForegroundColor Yellow
Get-CimInstance Win32_Processor |
    Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, LoadPercentage |
    Format-List

Write-Host "Memory" -ForegroundColor Yellow
$os = Get-CimInstance Win32_OperatingSystem
$totalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedGB = [math]::Round($totalGB - $freeGB, 2)
[PSCustomObject]@{
    TotalGB=$totalGB; UsedGB=$usedGB; FreeGB=$freeGB
    UsedPct=[math]::Round(($usedGB/$totalGB)*100,2)
} | Format-List

Write-Host "Logical Disks" -ForegroundColor Yellow
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
      @{N="SizeGB";E={[math]::Round($_.Size/1GB,2)}},
      @{N="FreeGB";E={[math]::Round($_.FreeSpace/1GB,2)}},
      @{N="FreePct";E={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}} |
    Format-Table -AutoSize
