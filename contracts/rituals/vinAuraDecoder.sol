// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Aura Decoder
/// @notice Logs first-impression aura assessments and emotional resonance metadata
contract vinAuraDecoder {
    struct AuraPing {
        uint256 timestamp;
        address observer;
        string subjectName;
        string archetype;      // e.g. Strategist, Guardian, Silent Flame, Trickster
        string emotionalPulse; // keywords like "conviction", "mystery", "tenacity"
        string resonanceNote;  // VINVIN-grade symbolic interpretation
    }

    address public scrollkeeper;
    uint256 public auraCount;
    mapping(uint256 => AuraPing) public auraLedger;

    event AuraDecoded(
        uint256 indexed id,
        address indexed observer,
        string subjectName,
        string archetype,
        string emotionalPulse
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logAura(
        string memory _subjectName,
        string memory _archetype,
        string memory _emotionalPulse,
        string memory _resonanceNote
    ) public {
        auraLedger[auraCount] = AuraPing({
            timestamp: block.timestamp,
            observer: msg.sender,
            subjectName: _subjectName,
            archetype: _archetype,
            emotionalPulse: _emotionalPulse,
            resonanceNote: _resonanceNote
        });

        emit AuraDecoded(auraCount, msg.sender, _subjectName, _archetype, _emotionalPulse);
        auraCount++;
    }

    function getAura(uint256 _id) public view returns (AuraPing memory) {
        require(_id < auraCount, "No aura ping found");
        return auraLedger[_id];
    }
}
