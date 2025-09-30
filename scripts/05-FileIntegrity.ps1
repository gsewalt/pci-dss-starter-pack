<#
.SYNOPSIS
    Generates baseline SHA256 hashes for critical, readable system files for FIM.

.NOTES
    Author          : Gregory Sewalt
    LinkedIn        : linkedin.com/in/gregory-sewalt-24942657/
    GitHub          : github.com/gsewalt
    Date Created    : 9/29/2025
    Last Modified   : 9/29/2025
    Version         : 1.3
    STIG-ID         : WN10-00-000XXX

.TESTED ON
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
#>

# Define readable files to monitor
$files = @(
    "C:\Windows\System32\drivers\etc\hosts",
    "C:\Windows\System32\drivers\etc\lmhosts.sam",
    "C:\Windows\System32\drivers\etc\networks"
)

# Generate baseline SHA256 hashes
foreach ($file in $files) {
    if (Test-Path $file) {
        try {
            $hash = (Get-FileHash $file -Algorithm SHA256).Hash
            Write-Host "Baseline hash for" $file ":" $hash
        } catch {
            Write-Host "Cannot read file:" $file "- Skipping."
        }
    } else {
        Write-Host "File not found:" $file
    }
}

Write-Host "File Integrity Monitoring baseline hashes generated successfully."

