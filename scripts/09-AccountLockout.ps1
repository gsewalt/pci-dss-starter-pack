<#
.SYNOPSIS
    Enforces account lockout policy for PCI-DSS compliance.

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

# Registry path for account lockout policy
$acctLockPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"

# Define lockout policy (customizable if needed)
$LockoutThreshold = 10       # Lock account after 10 failed logins
$LockoutDuration  = 15       # Duration in minutes
$LockoutObservationWindow = 15 # Observation window in minutes

# Set values
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -PropertyType DWORD -Value 1 -Force | Out-Null
Write-Host "Accounts with blank passwords disabled."

# Apply lockout policy via `net accounts`
net accounts /lockoutthreshold:$LockoutThreshold /lockoutduration:$LockoutDuration /lockoutwindow:$LockoutObservationWindow
Write-Host "Account lockout policy set: Threshold=$LockoutThreshold, Duration=$LockoutDuration min, Observation Window=$LockoutObservationWindow min."

Write-Host "Account lockout enforcement complete."
