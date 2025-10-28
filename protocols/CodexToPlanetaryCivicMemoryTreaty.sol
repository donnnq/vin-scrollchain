// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToPlanetaryCivicMemoryTreaty {
    address public steward;

    struct MemoryEntry {
        string codex; // "Senate hearings, legal rulings"
        string clause; // "Scrollchain-sealed treaty for civic memory and planetary consequence"
        string emotionalTag;
        bool archived;
        bool remembered;
    }

    MemoryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveCivicCodex(string memory codex, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoryEntry(codex, clause, emotionalTag, true, true));
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
