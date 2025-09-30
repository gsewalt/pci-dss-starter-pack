<#
.SYNOPSIS
    Enables logon and account lockout auditing for Windows 10 local accounts.

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

# Enable logon auditing
auditpol /set /subcategory:"Logon" /success:enable /failure:enable
Write-Host "Logon auditing enabled for success and failure."

# Enable account lockout auditing
auditpol /set /subcategory:"Account Lockout" /success:enable /failure:enable
Write-Host "Account lockout auditing enabled for success and failure."

Write-Host "Audit logging successfully configured."
