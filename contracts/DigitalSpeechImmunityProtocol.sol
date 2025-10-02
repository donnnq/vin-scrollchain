// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Digital Speech Immunity Protocol v1.0
/// @notice Ritualizes protection for digital expression, civic commentary, and emotionally tagged speech in vulnerable jurisdictions

contract DigitalSpeechImmunityProtocol {
    address public originator;

    struct SpeechEntry {
        string speakerTag; // e.g. "Vinvin", "Whistleblower", "Civic Commentator"
        string platformTag; // e.g. "Twitter", "YouTube", "TikTok"
        string speechType; // e.g. "Commentary", "Satire", "Whistleblow"
        string emotionalTag; // e.g. "Truth", "Justice", "Humility", "Restoration"
        bool isProtectedByScrollchain;
        bool isJurisdictionSensitive;
        uint256 timestamp;
    }

    SpeechEntry[] public speechLedger;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Log digital speech entry and tag for immunity
    function logSpeech(
        string memory speakerTag,
        string memory platformTag,
        string memory speechType,
        string memory emotionalTag,
        bool isJurisdictionSensitive
    ) external {
        speechLedger.push(SpeechEntry({
            speakerTag: speakerTag,
            platformTag: platformTag,
            speechType: speechType,
            emotionalTag: emotionalTag,
            isProtectedByScrollchain: true,
            isJurisdictionSensitive: isJurisdictionSensitive,
            timestamp: block.timestamp
        }));
    }

    /// @notice Count total protected speech entries
    function totalProtectedSpeech() external view returns (uint256 total) {
        for (uint256 i = 0; i < speechLedger.length; i++) {
            if (speechLedger[i].isProtectedByScrollchain) {
                total += 1;
            }
        }
    }

    /// @notice Emotional tags for speech rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Truth, 🔥 Justice, 🌱 Restoration, 🧭 Humility"
    }
}
