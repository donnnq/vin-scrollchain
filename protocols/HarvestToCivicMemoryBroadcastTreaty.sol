// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HarvestToCivicMemoryBroadcastTreaty {
    address public steward;

    struct MemoryEntry {
        string harvest; // "Palay floor price, RTL repeal"
        string clause; // "Scrollchain-sealed treaty for civic memory broadcast and planetary nourishment consequence"
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

    function broadcastHarvestMemory(string memory harvest, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoryEntry(harvest, clause, emotionalTag, true, true));
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
