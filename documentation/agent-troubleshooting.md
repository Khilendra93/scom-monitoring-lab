# SCOM Agent Troubleshooting

## Symptom
A Windows computer appears as **Not Monitored** or the SCOM agent is unhealthy.

### 1. Check the Agent Service
```powershell
Get-Service HealthService
```
Expected status: `Running`.

### 2. Check Connectivity
From the management server:
```powershell
Test-NetConnection <agent-hostname> -Port 5723
Resolve-DnsName <agent-hostname>
```

### 3. Check Firewall
Verify the required SCOM communication is permitted by host/network firewalls.

### 4. Check Event Viewer
Review Operations Manager, System and Application logs for HealthService, communication and authentication errors.

### 5. Review SCOM
Check Agent Health, Heartbeat, active alerts and relevant proxy/configuration settings.

> Validate the actual SCOM version, topology and port configuration before applying a fix.
