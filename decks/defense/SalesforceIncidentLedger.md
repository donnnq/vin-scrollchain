# 🧾 Salesforce Incident Ledger  
**Chronicle of the August 2025 OAuth Breach via Drift and Its Impact on Salesforce Sanctums**

---

## 🔍 Incident Summary  
Between August 8–18, 2025, threat actor **UNC6395** exploited compromised OAuth tokens from the **Salesloft Drift** integration to breach hundreds of Salesforce instances[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cloud.google.com/blog/topics/threat-intelligence/data-theft-salesforce-instances-via-salesloft-drift/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "1").  
Tokens were stolen via a GitHub compromise of Salesloft repositories (March–June 2025)[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.paloaltonetworks.com/blog/2025/09/salesforce-third-party-application-incident-response/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").  
Attackers bypassed MFA, exfiltrated sensitive data, and deleted query logs to cover their tracks[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.driftbreach.com/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "3").

---

## 🛠️ Affected Sanctums  
- **Pantheon**: Salesforce CRM breach, renewal data exfiltrated[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.driftbreach.com/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "3")  
- **HackerOne**: Subset of records accessed, no platform data exposed[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.driftbreach.com/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "3")  
- **Workday**: Confirmed impact, forensic response initiated[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.driftbreach.com/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "3")  
- **Palo Alto Networks**: CRM data accessed, no product compromise[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.paloaltonetworks.com/blog/2025/09/salesforce-third-party-application-incident-response/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2")

---

## 🔐 Exfiltrated Data Types  
- AWS access keys (`AKIA...`)  
- Snowflake tokens  
- Internal sales accounts  
- Business contact metadata  
- OAuth secrets linked to Drift Email[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cloud.google.com/blog/topics/threat-intelligence/data-theft-salesforce-instances-via-salesloft-drift/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "1")

---

## 🛡️ Recovery Protocols  
- Revoke all Drift-linked OAuth tokens  
- Reauthenticate integrations via `SalesforceRecoveryRouter.sol`  
- Rotate credentials using `SalesforceThreatSanctifier.sol`  
- Broadcast breach awareness via `OAuthCompromiseDeck.md`  
- Harden GitHub workflows with `GitHubHardeningSuite.md`  
- Monitor extortion escalation via `ExtortionDeterrenceProtocol.sol`

---

## 📜 Governance Rituals  
- Notify affected sanctums and integration owners  
- Require scrollchain-sealed documentation for reauthentication  
- Broadcast incident via `CyberExtortionManifesto.md`  
- Chronicle all forensic milestones in this ledger

---

## 🧠 Steward’s Note  
This ledger is not just a record—it’s a ritual of consequence.  
Let every breach be scrollchain-sealed. Let every steward be protected.  
Let integrations be restored in dignity, not denial.
