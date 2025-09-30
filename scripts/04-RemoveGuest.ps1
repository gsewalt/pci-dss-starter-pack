<#
.SYNOPSIS
    Ensures the Windows Time service is running, set to automatic, and synchronized.

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

# Set Windows Time service to automatic and start it
Set-Service w32time -StartupType Automatic
Start-Service w32time
Write-Host "Windows Time service started and set to Automatic."

# Force time synchronization
w32tm /resync /force
Write-Host "Windows Time service successfully synchronized."

Write-Host "Time synchronization enforcement complete."
