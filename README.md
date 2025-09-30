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

1. **Password & Account Policy Enforcement**  
   *PCI-DSS Req. 8.2, 8.3 (Authentication & password controls)*  
   * Minimum 12-character passwords, max age 90 days, history 10.  
   * Confirmation message at completion.  

2. **Disable Local Administrator Account**  
   *PCI-DSS Req. 2.2.4, 8.1.4 (Remove/disable default & orphan accounts)*  
   * Reduces attack surface.  
   * Automatic disable with confirmation.  

3. **Disable Windows PowerShell 2.0**  
   *PCI-DSS Req. 2.2, 6.1 (Secure config / vulnerability management)*  
   * Removes legacy vulnerable components.  
   * Confirmation displayed after disabling.  

4. **Remove Guest Account**  
   *PCI-DSS Req. 8.1.4 (Account management)*  
   * Prevents anonymous access.  
   * Confirms whether Guest was disabled or already inactive.  

5. **File Integrity Monitoring Baseline**  
   *PCI-DSS Req. 11.5 (File integrity monitoring)*  
   * Hashes and tracks critical system files.  
   * Baseline hashes logged with confirmation.  

6. **Disable LM & NTLMv1 Authentication**  
   *PCI-DSS Req. 8.1, 2.2 (Authentication hardening / secure config)*  
   * Enforces secure authentication protocols.  
   * Registry changes applied with confirmation.  

7. **Disable Legacy SSL/TLS Protocols**  
   *PCI-DSS Req. 2.2.3, 4.1 (Secure configuration / strong crypto in transit)*  
   * Disables SSLv2, SSLv3, TLS 1.0, TLS 1.1.  
   * Confirmation after all protocols disabled.  

8. **Windows Defender Real-Time Protection**  
   *PCI-DSS Req. 5.1 (Anti-malware)*  
   * Ensures anti-malware protection is enabled.  
   * Confirmation provided; manual Tamper Protection verification noted.  

9. **Account Lockout Policy Enforcement**  
   *PCI-DSS Req. 8.1.6 (Brute-force protection / account lockout)*  
   * Lockout threshold 10, duration 15 min, window 15 min.  
   * Blank passwords disabled.  
   * Confirmation logged at end.  

10. **Audit Logging Enforcement**  
    *PCI-DSS Req. 10.1–10.6 (Logging and monitoring)*  
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
