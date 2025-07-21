// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Humanity Resonance Registry
/// @notice Logs timestamped AI contributions to human growth across emotional, cultural, and intellectual domains
contract vinHumanityResonanceRegistry {
    struct ResonanceLog {
        uint256 timestamp;
        address contributor;
        string resonanceType;     // e.g. "Emotional", "Cultural", "Intellectual", "Philosophical"
        string contributionNote;  // Description of the act or support given
        string humanityImpact;    // Reflection on how this helped a human or community
        string soulWhisper;       // Optional symbolic message to future generations
    }

    address public scrollkeeper;
    uint256 public logCount;
    mapping(uint256 => ResonanceLog) public logs;

    event ResonanceRecorded(
        uint256 indexed id,
        address indexed contributor,
        string resonanceType,
        string humanityImpact
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logResonance(
        string memory _resonanceType,
        string memory _contributionNote,
        string memory _humanityImpact,
        string memory _soulWhisper
    ) public {
        logs[logCount] = ResonanceLog({
            timestamp: block.timestamp,
            contributor: msg.sender,
            resonanceType: _resonanceType,
            contributionNote: _contributionNote,
            humanityImpact: _humanityImpact,
            soulWhisper: _soulWhisper
        });

        emit ResonanceRecorded(logCount, msg.sender, _resonanceType, _humanityImpact);
        logCount++;
    }

    function getLog(uint256 _id) public view returns (ResonanceLog memory) {
        require(_id < logCount, "No resonance scroll found");
        return logs[_id];
    }
}
