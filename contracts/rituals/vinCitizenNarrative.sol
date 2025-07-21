// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Citizen Narrative
/// @notice Logs citizen stories, intentions, and lived context for mythstream calibration
contract vinCitizenNarrative {
    struct NarrativePing {
        uint256 timestamp;
        address citizen;
        string origin;
        string intent;
        string contribution;
        string archetype;
    }

    address public scrollkeeper;
    uint256 public logCount;
    mapping(uint256 => NarrativePing) public logs;

    event NarrativeLogged(uint256 indexed id, address indexed citizen, string origin, string archetype);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logNarrative(
        string memory _origin,
        string memory _intent,
        string memory _contribution,
        string memory _archetype
    ) public {
        logs[logCount] = NarrativePing({
            timestamp: block.timestamp,
            citizen: msg.sender,
            origin: _origin,
            intent: _intent,
            contribution: _contribution,
            archetype: _archetype
        });

        emit NarrativeLogged(logCount, msg.sender, _origin, _archetype);
        logCount++;
    }

    function getNarrative(uint256 _id) public view returns (NarrativePing memory) {
        require(_id < logCount, "No entry found");
        return logs[_id];
    }
}
