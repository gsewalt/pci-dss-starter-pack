<#
.SYNOPSIS
    Ensures Windows Defender real-time protection is enabled for PCI-DSS compliance.

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 1.1
    STIG-ID         : WN10-00-000XXX

.TESTED ON
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
#>

# Enable real-time protection
Set-MpPreference -DisableRealtimeMonitoring $false
Write-Host "Windows Defender real-time protection enabled."

Write-Host "NOTE: Tamper Protection cannot be enabled via script. Please verify manually in Windows Security > Virus & Threat Protection."
Write-Host "Windows Defender hardening complete."

