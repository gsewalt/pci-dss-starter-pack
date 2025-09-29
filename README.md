# PCI-DSS Automation Starter Pack 🚀

## 📌 What is PCI-DSS?

The **Payment Card Industry Data Security Standard (PCI-DSS)** is the global benchmark for protecting payment card data. If your organization handles credit card information in any way — storing, processing, or transmitting — PCI-DSS applies.

It consists of **12 major requirements**, covering everything from access control and authentication to logging, encryption, and vulnerability management. Think of it as the security checklist designed to **stop attackers from stealing cardholder data before it leaves your network**.

---

## 💡 Ok, but why does it matter?

PCI-DSS isn’t just a bureaucratic checkbox — it has real-world consequences:

* **Legal & contractual obligations:** Non-compliance can result in fines, lost merchant privileges, and higher transaction fees.
* **Security first:** Most PCI-DSS controls map directly to common attack vectors like weak passwords, unpatched software, or misconfigured services.
* **Operational hygiene:** PCI-DSS encourages a culture of continuous monitoring, auditing, and process discipline.

**Bottom line:** PCI-DSS compliance is your safety net — it doesn’t guarantee zero breaches, but it drastically reduces risk.

---

## 🛠️ My Approach

Rather than trying to tackle every obscure sub-requirement, this project takes an **80/20 approach**:

* **Prioritized controls:** Focus on the **Top 10 most impactful and frequently overlooked PCI-DSS controls**.
* **Automation-first:** Remediate via **PowerShell scripts** that:

  1. Check if the control is already in place.
  2. Remediate if it’s not compliant.
  3. Confirm implementation and log the result.
* **Scalable & repeatable:** Scripts can run locally, through GPO, Intune, Azure Automation, or in CI/CD pipelines.
* **Audit-friendly:** Each control maps directly to its PCI requirement ID, producing a clear compliance trail.

**The result:** organizations can cover the most critical PCI-DSS requirements with minimal overhead, reducing audit headaches while maximizing security impact.

---

## 🔟 The Top 10 Controls

### 1. Password & Account Policy Enforcement *(Req. 8.2, 8.3)*

**Why it matters:** Weak passwords remain a top cause of breaches. Attackers will brute-force or exploit stale accounts to gain access.
**How we help:**

* Enforce minimum 12-character, complex passwords.
* Lock accounts after 5 failed attempts.
* Automatically alert on misconfigured policies.

### 2. Disable Default & Dormant Accounts *(Req. 2.2.4, 8.1.4)*

**Why it matters:** Default or orphaned accounts are a hacker’s easiest entry point.
**How we help:**

* Detect inactive or unused accounts and disable them.
* Rename default “Administrator” accounts to prevent guessing attacks.

### 3. Audit Logging Enabled & Centralized *(Req. 10.1–10.6)*

**Why it matters:** Logs are your eyes and ears. Without them, security incidents go unnoticed, and post-incident investigations are nearly impossible.
**How we help:**

* Enable critical audit categories: login attempts, account changes, and policy modifications.
* Forward logs to a SIEM or centralized log collector for continuous monitoring.
* Confirm compliance and generate evidence for auditors automatically.

### 4. Time Synchronization *(Req. 10.4)*

**Why it matters:** Misaligned timestamps make logs unreliable. You can’t prove sequence of events without consistent time across systems.
**How we help:**

* Force NTP synchronization against a trusted source.
* Check drift and alert if it exceeds acceptable thresholds.

### 5. File Integrity Monitoring (FIM) *(Req. 11.5)*

**Why it matters:** Unauthorized changes to critical files or registry keys are often the first sign of compromise.
**How we help:**

* Hash and baseline important files (e.g., web.config, system configs).
* Detect changes in real-time and alert via console or SIEM.
* Confirm integrity post-remediation.

### 6. Service Hardening *(Req. 2.2.2, 2.2.3)*

**Why it matters:** Unnecessary services (Telnet, SMBv1, SNMP) are low-hanging fruit for attackers.
**How we help:**

* Detect and disable high-risk or unused services.
* Ensure systems conform to a secure baseline.
* Confirm service status automatically.

### 7. Encryption & Protocol Hardening *(Req. 2.2.3, 4.1)*

**Why it matters:** Legacy protocols like SSLv2/3 or weak TLS ciphers leave data exposed to interception.
**How we help:**

* Disable SSLv2, SSLv3, TLS 1.0/1.1.
* Enforce TLS 1.2+ across all systems.
* Verify compliance post-change.

### 8. Least Privilege & Role Review *(Req. 7.1, 7.2)*

**Why it matters:** Over-privileged accounts are a hacker’s shortcut to full domain compromise.
**How we help:**

* Audit local and domain admin groups.
* Remove unauthorized users automatically.
* Confirm only approved accounts retain elevated privileges.

### 9. Patch & Vulnerability Baseline *(Req. 6.2)*

**Why it matters:** Unpatched software is still the #1 attack vector.
**How we help:**

* Identify missing patches.
* Automate patch installation via PowerShell.
* Confirm post-patch compliance.

### 10. Secure Configuration Baselines *(Req. 2.2, 2.2.1)*

**Why it matters:** Misconfigured systems can silently leak sensitive data.
**How we help:**

* Enforce registry and OS-level configurations for RDP, firewall, crypto, etc.
* Apply CIS/PCI hardening templates consistently.
* Confirm compliance automatically.

---

## ⚙️ How It Works

All scripts follow the **Check → Remediate → Confirm** model:

1. **Check:** Is the control already in place?
2. **Remediate:** Apply the correct configuration if it’s not.
3. **Confirm:** Verify changes and log results.

Example output:

```plaintext
[PCI] Password policy already compliant.
[PCI] Disabled 3 inactive accounts.
[PCI] ALERT: web.config modified!
```

* Idempotent: safe to run multiple times.
* Audit-friendly: outputs can be saved to CSV, JSON, or EventLog.

---

## 📂 Repo Structure

```
PCI-DSS-Automation/
│
├── README.md
├── modules/
│   └── PCI-Remediate.psm1
├── scripts/
│   └── Run-PCI.ps1
└── reports/
    └── sample-output.log
```

---

## 🚀 Getting Started

1. Clone the repo:

```bash
git clone https://github.com/yourorg/pci-dss-automation.git
cd pci-dss-automation
```

2. Run individual scripts:

```powershell
.\scripts\Run-PCI.ps1
```

3. Or run the unified module:

```powershell
Import-Module .\modules\PCI-Remediate.psm1
Invoke-PCIControl -All
Invoke-PCIControl -Control Logging,Patching
```

---

## 📈 Roadmap

* Add Linux / Unix equivalents (Bash / Ansible).
* Create Azure-native automation templates.
* Export audit-ready compliance reports (JSON/CSV).
* Integrate with SIEM/SOAR workflows for real-time monitoring.

---

## ⚠️ Disclaimer

This project **does not guarantee PCI-DSS compliance**. It provides automation for **high-value, frequently audited controls**, giving organizations a **head start in securing cardholder data**. Always validate with your QSA and tailor scripts to your environment.


