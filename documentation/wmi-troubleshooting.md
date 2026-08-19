# WMI Troubleshooting

WMI issues can affect SCOM discovery and monitoring.

## Local Checks
```powershell
Get-Service Winmgmt
Get-CimInstance Win32_OperatingSystem
```

## Remote Check
```powershell
Get-CimInstance Win32_OperatingSystem -ComputerName <computer-name>
```

## RPC and DNS
```powershell
Test-NetConnection <computer-name> -Port 135
Resolve-DnsName <computer-name>
Get-Service RpcSs,Winmgmt
```

## Authentication
Verify credentials, permissions, firewall policy, RPC availability, WMI namespace permissions and DCOM configuration where applicable.

Avoid changing the WMI repository or security settings until the cause is understood and a recovery plan exists.
