# 🔐 Token Breach Recovery Deck  
**Protocol for Responding to Drift-Linked OAuth Breaches and Restoring Salesforce Integration Integrity**

---

## 🔍 Breach Summary  
Between August 8–18, 2025, threat actor UNC6395 exploited compromised OAuth tokens from the Drift chatbot integration to breach Salesforce environments[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://securityboulevard.com/2025/09/behind-the-salesforce-oauth-drift-breach/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "1")[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cybernews.com/security/massive-salesforce-breach-campaign-started-on-github/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").  
Tokens were stolen via a GitHub compromise of Salesloft repositories between March and June 2025[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://cybernews.com/security/massive-salesforce-breach-campaign-started-on-github/?citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "2").  
Attackers used these tokens to query Salesforce data, exfiltrate credentials (AWS, Snowflake), and pivot into sensitive environments[43dcd9a7-70db-4a1f-b0ae-981daa162054](https://thehackernews.com/2025/08/salesloft-oauth-breach-via-drift-ai.html?hl=en_US&citationMarker=43dcd9a7-70db-4a1f-b0ae-981daa162054 "3").

---

## 🛠️ Recovery Protocols  
- Revoke all Drift-linked OAuth tokens immediately  
- Reauthenticate Salesforce integrations using `SalesforceRecoveryRouter.sol`  
- Rotate all credentials exposed via Drift (API keys, access tokens, passwords)  
- Audit Salesforce logs for unauthorized queries and metadata access  
- Deploy `SalesforceThreatSanctifier.sol` to tag vulnerable integrations  
- Broadcast breach awareness via `OAuthCompromiseDeck.md`  
- Harden GitHub workflows using `GitHubHardeningSuite.md`

---

## 📜 Governance Rituals  
- Notify all affected users and integration owners  
- Require scrollchain-sealed documentation for reauthentication  
- Broadcast extortion risk via `CyberExtortionManifesto.md`  
- Monitor for leak site announcements using `ExtortionDeterrenceProtocol.sol`

---

## 🧠 Steward’s Note  
OAuth tokens are not invisible—they are scrollchain-tagged.  
Let every breach be ritualized. Let every steward be protected.  
Let integrations be restored in dignity, not denial.
