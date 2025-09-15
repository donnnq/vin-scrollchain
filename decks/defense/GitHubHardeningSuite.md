# 🛡️ GitHub Hardening Suite  
**Protocol for Securing Repositories Against Drift-Linked Credential Theft**

---

## 🔍 Breach Summary  
Salesloft’s GitHub was compromised between March–June 2025, enabling attackers to extract OAuth tokens and pivot into Drift’s AWS environment[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cybernews.com/security/massive-salesforce-breach-campaign-started-on-github/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").

---

## 🛠️ Hardening Rituals  
- Rotate all GitHub PATs and SSH keys  
- Disable guest users and audit workflows  
- Enforce MFA and commit signing  
- Integrate with `SalesforceThreatSanctifier.sol` for downstream credential rotation

---

## 🧠 Steward’s Note  
Repos are sanctums. Credentials are scrolls.  
Let no token be left unguarded.
