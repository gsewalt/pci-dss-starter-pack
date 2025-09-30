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

## 🔟 The Top 10 Controls

1. **Password & Account Policy Enforcement** *(Req. 8.2, 8.3)*

   * Minimum 12-character passwords, max age 90 days, history 10.
   * Confirmation message at completion.

2. **Disable Local Administrator Account** *(Req. 2.2.4, 8.1.4)*

   * Reduces attack surface.
   * Automatic disable with confirmation.

3. **Disable Windows PowerShell 2.0**

   * Removes legacy vulnerable components.
   * Confirmation displayed after disabling.

4. **Remove Guest Account**

   * Prevents anonymous access.
   * Confirms whether Guest was disabled or already inactive.

5. **File Integrity Monitoring Baseline** *(Req. 11.5)*

   * Hashes and tracks critical system files.
   * Baseline hashes logged with confirmation.

6. **Disable LM & NTLMv1 Authentication**

   * Enforces secure authentication protocols.
   * Registry changes applied with confirmation.

7. **Disable Legacy SSL/TLS Protocols** *(Req. 4.1)*

   * Disables SSLv2, SSLv3, TLS 1.0, TLS 1.1.
   * Confirmation after all protocols disabled.

8. **Windows Defender Real-Time Protection**

   * Ensures anti-malware protection is enabled.
   * Confirmation provided; manual Tamper Protection verification noted.

9. **Account Lockout Policy Enforcement** *(Req. 8.1.6)*

   * Lockout threshold 10, duration 15 min, window 15 min.
   * Blank passwords disabled.
   * Confirmation logged at end.

10. **Audit Logging Enforcement** *(Req. 10.1–10.6)*

    * Enables logon/logoff and object access auditing.
    * Confirmation displayed; Security log retention requires manual verification.

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
2. Alternatively, download individual script as needed from the table below and run separately:
3. ### Downloadable scripts (individual)

### Downloadable scripts (individual)

| Description | PCI-DSS requirement(s) | Download |
|---|---|---|
| Enforce local password policy (min length 12, max age 90d, history) | Req. 8.2, 8.3 (Authentication & password controls) | [Download](scripts/01-PasswordPolicy.ps1) |
| Safely disable default/local Administrator and inactive local accounts | Req. 2.2.4, 8.1.4 (Remove/disable default & orphan accounts) | [Download](scripts/02-DisableAdminAccount.ps1) |
| Disable Windows PowerShell 2.0 optional feature (remove legacy component) | Req. 2.2 / Req. 6.1 (Secure config / vulnerability exposure) | [Download](scripts/03-DisablePS2.ps1) |
| Disable the built-in Guest account to prevent anonymous access | Req. 8.1.4 (Account management) | [Download](scripts/04-RemoveGuest.ps1) |
| Generate/readable baseline SHA256 hashes for critical files (FIM baseline) | Req. 11.5 (File integrity monitoring) | [Download](scripts/05-FileIntegrity.ps1) |
| Enforce LmCompatibilityLevel / disable LM & NTLMv1 (legacy auth) | Req. 8.1 / Req. 2.2 (Authentication hardening / secure config) | [Download](scripts/06-DisableLMNTLMv1.ps1) |
| Disable SSLv2, SSLv3, TLS1.0 and TLS1.1 (SCHANNEL registry hardening) | Req. 2.2.3, 4.1 (Secure configuration / strong crypto in transit) | [Download](scripts/07-DisableLegacyTLS.ps1) |
| Enable Windows Defender real-time scanning (note: Tamper Protection must be verified manually) | Req. 5.1 (Anti-malware) | [Download](scripts/08-WDRealTime.ps1) |
| Enforce account lockout policy (threshold, duration, observation window) | Req. 8.1.6 (Brute-force protection / account lockout) | [Download](scripts/09-AccountLockout.ps1) |
| Enable Logon/Logoff and Object Access auditing (auditpol) | Req. 10.1–10.6 (Logging and monitoring) | [Download](scripts/10-AuditLogging.ps1) |

4. Review the **sequential confirmation messages** at the bottom of the output.

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
