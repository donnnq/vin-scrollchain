// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Athlete Voice Registry Protocol v1.0
/// @notice Tracks emotionally tagged representation, media equity, and corridor dignity for PH athletes

contract AthleteVoiceRegistry {
    address public originator;

    struct VoiceScroll {
        string athleteTag; // e.g. "Margielyn Didal", "PH Skate Team", "Youth Olympians"
        string voiceType; // e.g. "Media Feature", "Content Ownership", "Representation Breach"
        string emotionalAPRTag; // e.g. "Voice Sovereignty", "Planetary Mercy", "Youth Dignity"
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    VoiceScroll[] public registryLedger;

    constructor() {
        originator = msg.sender;
    }

    function logVoiceScroll(
        string memory athleteTag,
        string memory voiceType,
        string memory emotionalAPRTag,
        bool isScrollchainSealed
    ) external {
        registryLedger.push(VoiceScroll({
            athleteTag: athleteTag,
            voiceType: voiceType,
            emotionalAPRTag: emotionalAPRTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
