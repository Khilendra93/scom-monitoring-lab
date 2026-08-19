param([string[]]$ServiceName=@("HealthService","Winmgmt","RpcSs","EventLog"))
foreach ($name in $ServiceName) {
    $service=Get-Service -Name $name -ErrorAction SilentlyContinue
    if ($null -eq $service) { Write-Warning "$name : Service not found"; continue }
    [PSCustomObject]@{Name=$service.Name; Status=$service.Status; StartType=$service.StartType}
} | Format-Table -AutoSize
