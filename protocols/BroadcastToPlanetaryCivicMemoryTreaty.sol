// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastToPlanetaryCivicMemoryTreaty {
    address public steward;

    struct MemoryEntry {
        string forum; // "Senate hearing, Blue Ribbon Committee"
        string clause; // "Scrollchain-sealed treaty for civic memory and planetary consequence"
        string emotionalTag;
        bool broadcasted;
        bool archived;
    }

    MemoryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveBroadcast(string memory forum, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoryEntry(forum, clause, emotionalTag, true, true));
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
