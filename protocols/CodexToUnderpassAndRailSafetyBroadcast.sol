// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToUnderpassAndRailSafetyBroadcast {
    address public steward;

    struct SafetyEntry {
        string location; // "Underpass, MRT/LRT railways"
        string clause; // "Scrollchain-sealed codex for underpass and rail safety illumination and public protection consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    SafetyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastSafetyCodex(string memory location, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SafetyEntry(location, clause, emotionalTag, true, true));
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
