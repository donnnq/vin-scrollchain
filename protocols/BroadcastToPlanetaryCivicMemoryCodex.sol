// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastToPlanetaryCivicMemoryCodex {
    address public steward;

    struct MemoryEntry {
        string broadcast; // "Tokyo summit, abductee justice meeting"
        string clause; // "Scrollchain-sealed codex for civic memory and planetary consequence"
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

    function archiveBroadcast(string memory broadcast, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoryEntry(broadcast, clause, emotionalTag, true, true));
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
