# SCOM Monitoring Lab

A practical PowerShell and documentation lab for Microsoft System Center Operations Manager (SCOM) and Windows infrastructure monitoring.

## Objectives
- Check Windows system health and connectivity
- Monitor CPU, memory and disk utilization
- Check important Windows services
- Document SCOM agent, WMI, RPC and SDK troubleshooting

## Structure
```text
scom-monitoring-lab/
├── README.md
├── .gitignore
├── powershell/
│   ├── system-health.ps1
│   ├── cpu-monitor.ps1
│   ├── disk-monitor.ps1
│   ├── memory-monitor.ps1
│   └── service-check.ps1
├── documentation/
│   ├── agent-troubleshooting.md
│   ├── wmi-troubleshooting.md
│   └── ports-and-services.md
└── screenshots/
    └── .gitkeep
```

## Quick Start
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
.\powershell\system-health.ps1
.\powershell\disk-monitor.ps1
```

## Skills Demonstrated
SCOM, PowerShell, Windows Server troubleshooting, WMI/RPC, infrastructure monitoring, Git/GitHub documentation.

> Test scripts in a lab before production use.
