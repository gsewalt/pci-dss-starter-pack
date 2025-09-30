<#
.SYNOPSIS
    Disables the default Administrator account (if it exists) and any inactive local accounts safely on Windows 10.

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

# Disable default Administrator account if it exists
$admin = Get-LocalUser -Name "Administrator" -ErrorAction SilentlyContinue
if ($admin) {
    Disable-LocalUser -Name "Administrator"
    Write-Host "Default Administrator account disabled."
} else {
    Write-Host "Default Administrator account not found or already renamed."
}

# Disable inactive local accounts (inactive >90 days), excluding system accounts
$threshold = (Get-Date).AddDays(-90)
$excludedAccounts = @("Guest","DefaultAccount","Administrator")
Get-LocalUser | Where-Object {
    $_.Enabled -eq $true -and
    $_.LastLogon -and
    $_.LastLogon -lt $threshold -and
    $_.Name -notin $excludedAccounts
} | ForEach-Object {
    Disable-LocalUser $_.Name
    Write-Host "Disabled inactive account: $($_.Name)"
}

Write-Host "Inactive local accounts successfully disabled."
