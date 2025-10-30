// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryMemoryBroadcastLedger {
    address public steward;

    struct MemoryEntry {
        string region; // "Philippines, South Africa, Global"
        string clause; // "Scrollchain-sealed ledger for planetary memory broadcast and historical ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    MemoryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastMemory(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoryEntry(region, clause, emotionalTag, true, true));
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
