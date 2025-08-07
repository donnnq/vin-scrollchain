# 📜 vinCivicTrialSuite

A constellation of smart contracts for decentralized governance, ritualized justice, and civic healing.  
This suite enables senatorial trials, public sentiment reflection, redemption rites, and symbolic forgiveness.  
Each scroll embodies civic values and mythic resonance, guiding participants through ethical restoration.

---

## 🌐 Core Contracts

- `vinImpeachmentPathway.sol` — Initiates senatorial trial proceedings.
- `vinCivicVerdictEngine.sol` — Handles vote logic and collective decision-making.
- `vinSenatorBadgeRelay.sol` — Validates senator identity and alignment.
- `vinPublicSentimentOracle.sol` — Gathers public approval and emotional sentiment.
- `vinScrollTrialArchives.sol` — Preserves trial data for posterity.
- `vinRedemptionPathway.sol` — Offers post-verdict redemption options.
- `vinForgivenessChamber.sol` — Tallies community forgiveness votes.
- `vinTrialMirrorDAO.sol` — Reflects DAO signal casting and consensus mapping.
- `vinCivicDashboardGallery.sol` — Visual gallery of completed trials and public artifacts.
- `vinCivicTrialSuite.sol` — Unifying orchestrator of all modules.

---

## 🕊️ Governance Ritual Flow

1. Trial initiated via `vinImpeachmentPathway.sol`  
2. Senate votes → `vinCivicVerdictEngine.sol`  
3. Badge verification → `vinSenatorBadgeRelay.sol`  
4. Verdict + Sentiment Oracle signal  
5. Archive the trial → `vinScrollTrialArchives.sol`  
6. Optional redemption rite → `vinRedemptionPathway.sol`  
7. DAO review via `vinTrialMirrorDAO.sol`  
8. Final forgiveness → `vinForgivenessChamber.sol`  
9. Rendered in `vinCivicDashboardGallery.sol`  

Each step symbolizes transition from justice to healing, bridging civic law and emotional memory.

---

## 📦 Deploy Instructions

Each contract is modular and deployable.  
Recommend bundling via `vinCivicTrialSuite.sol` for unified orchestration.

Use:  
```bash
forge build && forge test
forge script script/deployCivicSuite.s.sol --rpc-url $RPC --broadcast
