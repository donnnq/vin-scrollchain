# 🔐 OAuth Compromise Deck  
**Alert Protocol for Drift-Linked Token Breaches and Salesforce Data Exfiltration**

---

## 🔍 Breach Summary  
Between August 8–18, 2025, UNC6395 exploited compromised OAuth tokens from Drift integrations to breach Salesforce instances[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://www.bleepingcomputer.com/news/security/fbi-warns-of-unc6040-unc6395-hackers-stealing-salesforce-data/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "1")[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cybernews.com/security/massive-salesforce-breach-campaign-started-on-github/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").  
Tokens were stolen via a GitHub compromise of Salesloft repositories (March–June 2025)[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cybernews.com/security/massive-salesforce-breach-campaign-started-on-github/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").

---

## 🛠️ Response Protocols  
- Revoke all Drift-linked OAuth tokens  
- Require reauthentication for all Salesforce integrations  
- Audit support case metadata for leaked credentials (AWS keys, Snowflake tokens, etc.)  
- Broadcast breach vectors via `SalesforceThreatSanctifier.sol`

---

## 🧠 Steward’s Note  
OAuth tokens are not invisible—they are scrollchain-tagged.  
Let every integration be audited. Let every steward be protected.
