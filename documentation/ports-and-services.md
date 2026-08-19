# SCOM Ports and Services

Commonly relevant items vary by SCOM version and topology.

| Item | Purpose |
|---|---|
| TCP 5723 | Agent communication in common configurations |
| TCP 5724 | SDK/management group communication in common configurations |
| TCP 135 | RPC endpoint mapper |
| Dynamic RPC ports | RPC communication |
| HealthService | SCOM Agent service |
| Winmgmt | WMI service |
| RpcSs | RPC service |

Check a port:
```powershell
Test-NetConnection <server-name> -Port 5723
```

Check listening ports:
```powershell
Get-NetTCPConnection -State Listen |
  Sort-Object LocalPort |
  Select-Object LocalAddress,LocalPort,OwningProcess
```

On older Windows:
```cmd
netstat -ano
```

> Validate ports against your actual SCOM architecture before changing firewall rules.
