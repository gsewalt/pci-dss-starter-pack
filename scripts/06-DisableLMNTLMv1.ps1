<#
.SYNOPSIS
    Disables LM and NTLMv1 authentication to enforce stronger authentication protocols for PCI-DSS compliance.

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 1.0
    STIG-ID         : WN10-00-000XXX

.TESTED ON
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
#>

# Disable LM and NTLMv1 for LAN Manager authentication
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -PropertyType DWORD -Value 5 -Force
Write-Host "LM & NTLMv1 authentication disabled (LAN Manager compatibility level set to 5)."

# Disable NTLMv1 over network
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" -PropertyType DWORD -Value 537395200 -Force
Write-Host "NTLMv1 over network disabled."

