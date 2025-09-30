<#
.SYNOPSIS
    Enables auditing for PCI-DSS compliance (Logon/Logoff and Object Access).

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 1.2
    STIG-ID         : WN10-00-000XXX

.TESTED ON
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
#>

# Enable auditing for logon/logoff and object access
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
Write-Host "Account logon audit enabled (success and failure)."

auditpol /set /category:"Object Access" /success:enable /failure:enable
Write-Host "Object access audit enabled (success and failure)."

Write-Host "NOTE: Security log retention cannot be reliably set via script on Windows 10. Please verify retention via Event Viewer or Group Policy."
Write-Host "Audit logging enforcement complete."


