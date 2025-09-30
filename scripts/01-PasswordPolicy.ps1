<#
.SYNOPSIS
    This PowerShell script enforces a minimum password length of 12, a maximum password age of 90 days,
    and a password history size of 24 on a Windows 10 system via the registry.

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000XXX

.TESTED ON
    Date(s) Tested  : 9/29/2025
    Tested By       : Gregory Sewalt
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Open PowerShell as an Administrator to run the script.
    Example Syntax:
        PS C:\> .\remediation(WN10-00-000XXX).ps1
    Confirmation messages will be displayed for each registry key that was set.
#>

# Set minimum password length to 12
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "MinimumPasswordLength" -Value 12

# Set maximum password age to 90 days
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "MaximumPasswordAge" -Value 90

# Set password history size to 24
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "PasswordHistorySize" -Value 24

# Optional: set account lockout threshold and duration
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "LockoutThreshold" -Value 5
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "LockoutDuration" -Value 10

# Confirmation messages
Write-Host "MinimumPasswordLength successfully set to 12."
Write-Host "MaximumPasswordAge successfully set to 90 days."
Write-Host "PasswordHistorySize successfully set to 24."
Write-Host "LockoutThreshold successfully set to 5 attempts."
Write-Host "LockoutDuration successfully set to 10 minutes."
Write-Host "Windows 10 local password policy successfully enforced."

