# PCI-DSS Automation Starter Pack 🚀

[Composite Script Download](scripts/PCI-DSS_Top10-Remediation.ps1)

## 📌 What is PCI-DSS?

The **Payment Card Industry Data Security Standard (PCI-DSS)** is the global benchmark for protecting payment card data. It applies to any organization handling credit card information — storing, processing, or transmitting.

It consists of **12 major requirements**, covering access control, authentication, logging, encryption, and vulnerability management.

---

## 💡 Why does it matter?

PCI-DSS isn’t just bureaucracy — it has real-world consequences:

* **Legal & contractual obligations:** Non-compliance can result in fines, lost merchant privileges, and higher transaction fees.
* **Security first:** Most PCI-DSS controls map to common attack vectors like weak passwords, unpatched software, or misconfigured services.
* **Operational hygiene:** PCI-DSS promotes continuous monitoring, auditing, and disciplined processes.

**Bottom line:** PCI-DSS compliance reduces risk and strengthens security posture.

---

## 🛠️ Our Approach

This project implements an **80/20 approach**, focusing on the **Top 10 most impactful, commonly overlooked PCI-DSS controls** for Windows 10:

* **Automation-first:** PowerShell scripts check, remediate, and confirm compliance.
* **Idempotent & safe:** Scripts can run multiple times without adverse effects.
* **Audit-friendly:** Each remediation outputs clear confirmation messages for compliance evidence.
* **Plug-and-play:** No system-specific modifications required; works on any Windows 10 machine.

---

## 🔟 The Top 10 Controls (what each script does + PCI requirement)

1. **Password & Account Policy Enforcement**
   *Script:* `scripts/01-PasswordPolicy.ps1` — **Download**: [01-PasswordPolicy.ps1](scripts/01-PasswordPolicy.ps1)
   *What it does:* Enforces minimum 12-character passwords, max age 90 days, password history.
   *PCI-DSS:* Req. 8.2, 8.3 (Authentication and account policies)

2. **Disable Local Administrator Account**
   *Script:* `scripts/02-DisableAdminAccount.ps1` — **Download**: [02-DisableAdminAccount.ps1](scripts/02-DisableAdminAccount.ps1)
   *What it does:* Safely disables built-in Administrator and inactive local accounts.
   *PCI-DSS:* Req. 2.2.4, 8.1.4 (Remove/disable default & orphan accounts)

3. **Disable Windows PowerShell 2.0**
   *Script:* `scripts/03-DisablePS2.ps1` — **Download**: [03-DisablePS2.ps1](scripts/03-DisablePS2.ps1)
   *What it does:* Disables legacy PowerShell v2 optional feature to remove vulnerable components.
   *PCI-DSS:* Req. 2.2, 6.1 (Secure configuration / vulnerability exposure)

4. **Remove Guest Account**
   *Script:* `scripts/04-RemoveGuest.ps1` — **Download**: [04-RemoveGuest.ps1](scripts/04-RemoveGuest.ps1)
   *What it does:* Disables the built-in Guest account to prevent anonymous access.
   *PCI-DSS:* Req. 8.1.4 (Account management)

5. **File Integrity Monitoring Baseline**
   *Script:* `scripts/05-FileIntegrity.ps1` — **Download**: [05-FileIntegrity.ps1](scripts/05-FileIntegrity.ps1)
   *What it does:* Generates SHA256 baseline hashes for readable critical files (FIM baseline).
   *PCI-DSS:* Req. 11.5 (File integrity monitoring)

6. **Disable LM & NTLMv1 Authentication**
   *Script:* `scripts/06-DisableLMNTLMv1.ps1` — **Download**: [06-DisableLMNTLMv1.ps1](scripts/06-DisableLMNTLMv1.ps1)
   *What it does:* Sets registry to enforce LmCompatibilityLevel and disable NTLMv1.
   *PCI-DSS:* Req. 8.1, 2.2 (Authentication hardening / secure configuration)

7. **Disable Legacy SSL/TLS Protocols**
   *Script:* `scripts/07-DisableLegacyTLS.ps1` — **Download**: [07-DisableLegacyTLS.ps1](scripts/07-DisableLegacyTLS.ps1)
   *What it does:* Disables SSLv2, SSLv3, TLS 1.0 and TLS 1.1 in SCHANNEL for client & server.
   *PCI-DSS:* Req. 4.1, 2.2.3 (Strong encryption in transit / secure configuration)

8. **Windows Defender Real-Time Protection**
   *Script:* `scripts/08-WDRealTime.ps1` — **Download**: [08-WDRealTime.ps1](scripts/08-WDRealTime.ps1)
   *What it does:* Enables Windows Defender real-time scanning (Tamper Protection must be verified manually).
   *PCI-DSS:* Req. 5.1 (Anti-malware)

9. **Account Lockout Policy Enforcement**
   *Script:* `scripts/09-AccountLockout.ps1` — **Download**: [09-AccountLockout.ps1](scripts/09-AccountLockout.ps1)
   *What it does:* Enforces lockout threshold (10), duration (15 min), observation window (15 min) and disables blank passwords.
   *PCI-DSS:* Req. 8.1.6 (Brute-force protection / account lockout)

10. **Audit Logging Enforcement**
    *Script:* `scripts/10-AuditLogging.ps1` — **Download**: [10-AuditLogging.ps1](scripts/10-AuditLogging.ps1)
    *What it does:* Enables logon/logoff and object access auditing via `auditpol`.
    *PCI-DSS:* Req. 10.1–10.6 (Logging, monitoring, and retention)

---

## ⚙️ How It Works

Scripts follow a **Check → Remediate → Confirm** model:

1. **Check:** Is the control already compliant?
2. **Remediate:** Apply the correct configuration.
3. **Confirm:** Log results in sequential confirmation messages.

All messages are displayed **together at the end** for easy review.

Example output:

```plaintext
1) Password policy enforced: Minimum 12 chars, max age 90 days, history 10.
2) Administrator account disabled.
3) Windows PowerShell 2.0 disabled.
...
10) Audit logging enabled for Logon/Logoff and Object Access.
```

---

## 📂 Repo Structure

```
PCI-DSS-PowerShell-Remediations/
│
├── README.md
├── scripts/
│   └── PCI-DSS-Top10-Remediation.ps1
```

---

## 🚀 To use:

1. Download and run the [starter pack composite script.](scripts/PCI-DSS_Top10-Remediation.ps1)

```powershell
.\scripts\PCI-DSS-Top10-Remediation.ps1
```

2. Or run individual scripts from the table above by clicking the respective download links.
3. Review the **sequential confirmation messages** at the bottom of the output.

---

## 📈 Roadmap

* Add Linux / Unix equivalents (Bash / Ansible).
* Create Azure-native automation templates.
* Export audit-ready compliance reports (JSON/CSV).
* Integrate with SIEM/SOAR workflows.

---

## ⚠️ Disclaimer

This project **does not guarantee PCI-DSS compliance**. It automates **high-value, frequently audited controls** for Windows 10 systems. Always validate with your QSA and tailor scripts to your environment.

---

## License

© 2025 Gregory Sewalt. All rights reserved.

Permission is granted to any person or entity (“Licensee”) to use, copy, modify, merge, publish, distribute, and sublicense
this software (the “Software”), subject to the following:

1. **No Compliance Warranty:** Use of this Software does NOT guarantee PCI-DSS or other regulatory compliance. Licensee assumes all risk.
2. **“As-Is” Disclaimer:** The Software is provided without warranty of any kind, express or implied, including merchantability, fitness, or non-infringement.
3. **Attribution:** This copyright notice and disclaimer must remain with all copies or substantial portions of the Software.
4. **Indemnification:** Licensee shall hold harmless Gregory Sewalt from any claims, losses, or damages arising from use.

By using, copying, or distributing the Software, Licensee agrees to these terms.

