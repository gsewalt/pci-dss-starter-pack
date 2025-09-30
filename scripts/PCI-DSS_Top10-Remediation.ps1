<#
.SYNOPSIS
    Composite PowerShell script implementing the Top 10 PCI-DSS remediations for Windows 10.
    Confirmation messages are displayed sequentially at the end.

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 2.0
#>

# Array to store confirmation messages
$Confirmations = @()

# ================================
# 1) Password & Account Policy Enforcement
# ================================
net accounts /minpwlen:12 /maxpwage:90 /minpwage:1 /uniquepw:10
$Confirmations += "1) Password policy enforced: Minimum 12 chars, max age 90 days, history 10."

# ================================
# 2) Disable Local Administrator Account
# ================================
$admin = Get-LocalUser -Name "Administrator" -ErrorAction SilentlyContinue
if ($admin) {
    if ($admin.Enabled) { Disable-LocalUser -Name "Administrator"; $Confirmations += "2) Administrator account disabled." }
    else { $Confirmations += "2) Administrator account already disabled." }
} else { $Confirmations += "2) Administrator account not found." }

# ================================
# 3) Disable Windows PowerShell 2.0
# ================================
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root
$Confirmations += "3) Windows PowerShell 2.0 disabled."

# ================================
# 4) Remove Guest Account
# ================================
$guest = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue
if ($guest) {
    if ($guest.Enabled) { Disable-LocalUser -Name "Guest"; $Confirmations += "4) Guest account disabled." }
    else { $Confirmations += "4) Guest account already disabled." }
} else { $Confirmations += "4) Guest account not found." }

# ================================
# 5) File Integrity Monitoring Baseline
# ================================
$files = @(
    "C:\Windows\System32\drivers\etc\hosts",
    "C:\Windows\System32\drivers\etc\lmhosts.sam",
    "C:\Windows\System32\drivers\etc\networks"
)
foreach ($file in $files) {
    if (Test-Path $file) {
        try {
            $hash = (Get-FileHash $file -Algorithm SHA256).Hash
        } catch { $hash = "Cannot read"; }
    } else { $hash = "File not found"; }
    $Confirmations += "5) Baseline hash for $file : $hash"
}

# ================================
# 6) Disable LM & NTLMv1 Authentication
# ================================
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -PropertyType DWORD -Value 5 -Force
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" -PropertyType DWORD -Value 537395200 -Force
$Confirmations += "6) LM & NTLMv1 authentication disabled."

# ================================
# 7) Disable Legacy SSL/TLS Protocols
# ================================
$schannel = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"
$protocols = @("SSL 2.0","SSL 3.0","TLS 1.0","TLS 1.1")
foreach ($proto in $protocols) {
    foreach ($role in @("Client","Server")) {
        $path = "$schannel\$proto\$role"
        New-Item -Path $path -Force | Out-Null
        New-ItemProperty -Path $path -Name "Enabled" -PropertyType DWORD -Value 0 -Force
    }
}
$Confirmations += "7) Legacy SSL/TLS protocols disabled (SSLv2, SSLv3, TLS 1.0, TLS 1.1)."

# ================================
# 8) Windows Defender Real-Time Protection
# ================================
Set-MpPreference -DisableRealtimeMonitoring $false
$Confirmations += "8) Windows Defender real-time protection enabled. NOTE: Tamper Protection must be verified manually."

# ================================
# 9) Account Lockout Policy Enforcement
# ================================
net accounts /lockoutthreshold:10 /lockoutduration:15 /lockoutwindow:15
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -PropertyType DWORD -Value 1 -Force
$Confirmations += "9) Account lockout policy applied (Threshold=10, Duration=15min, Window=15min) and blank passwords disabled."

# ================================
# 10) Audit Logging Enforcement
# ================================
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
auditpol /set /category:"Object Access" /success:enable /failure:enable
$Confirmations += "10) Audit logging enabled for Logon/Logoff and Object Access. NOTE: Security log retention must be verified manually."

# ================================
# Display all confirmation messages sequentially
# ================================
Write-Host "`n=== PCI-DSS Remediation Summary ==="
foreach ($msg in $Confirmations) { Write-Host $msg }
Write-Host "=== End of Remediation Summary ==="


