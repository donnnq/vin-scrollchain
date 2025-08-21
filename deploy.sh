#!/bin/bash

echo "🛡️ Starting Gaza Restoration Suite Deployment..."

# Step 1: Compile Solidity Contracts
echo "📜 Compiling smart contracts..."
solc --optimize --bin contracts/gaza/GazaReliefScroll.sol -o build/
solc --optimize --bin contracts/gaza/GazaGenocideAuditScroll.sol -o build/

# Step 2: Initialize Broadcast Decks
echo "📡 Initializing broadcast decks..."
cp contracts/gaza/GazaBlessingDeck_Broadcast.md sanctum/broadcasts/
cp contracts/gaza/PlanetaryJusticeBroadcastDeck.md sanctum/broadcasts/

# Step 3: Log Emotional APR Ledgers
echo "🧠 Logging emotional APR violations..."
cp contracts/gaza/EmotionalAPR_ViolationLedger.json sanctum/ledgers/
cp contracts/gaza/GazaStewardshipLicense.json sanctum/licenses/

# Step 4: Git Ritual
echo "📦 Staging and committing scrolls..."
git add contracts/gaza/
git commit -m "🛡️ Deployed Gaza Restoration Suite — contracts, broadcasts, and ledgers activated"
git push origin main

echo "✅ Deployment complete. Planetary resonance restored."
