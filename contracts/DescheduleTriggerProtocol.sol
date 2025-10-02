// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Deschedule Trigger Protocol v1.0
/// @notice Emotionally tagged smart contract for tracking cannabis descheduling signals and civic activation

contract DescheduleTriggerProtocol {
    struct TriggerSignal {
        string source; // e.g. "Trump Speech", "Congress Bill", "Public Poll"
        uint256 timestamp;
        bool isFederal;
        bool isMediaAmplified;
        bool isCivicEndorsed;
        string sentimentTag; // e.g. "Urgency", "Skepticism", "Momentum"
    }

    TriggerSignal[] public signals;

    /// @notice Log a new descheduling trigger signal
    function logTrigger(
        string memory source,
        uint256 timestamp,
        bool federal,
        bool mediaAmplified,
        bool civicEndorsed,
        string memory sentimentTag
    ) external {
        signals.push(TriggerSignal({
            source: source,
            timestamp: timestamp,
            isFederal: federal,
            isMediaAmplified: mediaAmplified,
            isCivicEndorsed: civicEndorsed,
            sentimentTag: sentimentTag
        }));
    }

    /// @notice Count federally linked descheduling signals
    function countFederalSignals() external view returns (uint256 count) {
        for (uint256 i = 0; i < signals.length; i++) {
            if (signals[i].isFederal) {
                count++;
            }
        }
    }

    /// @notice Count signals with civic endorsement
    function countCivicEndorsed() external view returns (uint256 count) {
        for (uint256 i = 0; i < signals.length; i++) {
            if (signals[i].isCivicEndorsed) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for descheduling resonance
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🔥 Deterrence, 🧭 Restoration";
    }
}
