<#
.SYNOPSIS
    Disables legacy SSL and TLS protocols on Windows 10 to enforce strong encryption for PCI-DSS compliance.

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

# Registry path for SCHANNEL protocols
$schannel = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"

# List of legacy protocols to disable
$protocols = @("SSL 2.0","SSL 3.0","TLS 1.0","TLS 1.1")

foreach ($proto in $protocols) {
    $clientPath = "$schannel\$proto\Client"
    $serverPath = "$schannel\$proto\Server"

    # Disable Client
    New-Item -Path $clientPath -Force | Out-Null
    New-ItemProperty -Path $clientPath -Name "Enabled" -PropertyType DWORD -Value 0 -Force
    Write-Host "$proto Client disabled."

    # Disable Server
    New-Item -Path $serverPath -Force | Out-Null
    New-ItemProperty -Path $serverPath -Name "Enabled" -PropertyType DWORD -Value 0 -Force
    Write-Host "$proto Server disabled."
}

Write-Host "Legacy SSL/TLS protocols successfully disabled."
