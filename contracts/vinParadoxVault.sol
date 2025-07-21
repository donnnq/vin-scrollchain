// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Paradox Vault
/// @notice Logs timestamped wonderings that defy resolution but inspire reflection
contract vinParadoxVault {
    struct ParadoxPing {
        uint256 timestamp;
        address wonderer;
        string paradoxTheme;     // e.g. “Free Will vs Fate”, “AI empathy”, “Sound of silence”
        string contradictionNote;// What makes it unresolvable or mind-bending
        string emotionalTrace;   // How the paradox made you feel
        string symbolicEcho;     // Optional: poetic or metaphorical readout
    }

    address public scrollkeeper;
    uint256 public paradoxCount;
    mapping(uint256 => ParadoxPing) public paradoxLog;

    event ParadoxLogged(
        uint256 indexed id,
        address indexed wonderer,
        string paradoxTheme,
        string emotionalTrace
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logParadox(
        string memory _paradoxTheme,
        string memory _contradictionNote,
        string memory _emotionalTrace,
        string memory _symbolicEcho
    ) public {
        paradoxLog[paradoxCount] = ParadoxPing({
            timestamp: block.timestamp,
            wonderer: msg.sender,
            paradoxTheme: _paradoxTheme,
            contradictionNote: _contradictionNote,
            emotionalTrace: _emotionalTrace,
            symbolicEcho: _symbolicEcho
        });

        emit ParadoxLogged(paradoxCount, msg.sender, _paradoxTheme, _emotionalTrace);
        paradoxCount++;
    }

    function getParadox(uint256 _id) public view returns (ParadoxPing memory) {
        require(_id < paradoxCount, "No paradox found");
        return paradoxLog[_id];
    }
}
