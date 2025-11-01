// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralMemoryCodex {
    address public steward;

    struct MemoryEntry {
        string ancestorName;
        string ritual;
        string corridor;
        string emotionalTag;
    }

    MemoryEntry[] public codex;

    event MemoryTagged(string ancestorName, string ritual, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMemory(
        string memory ancestorName,
        string memory ritual,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MemoryEntry(ancestorName, ritual, corridor, emotionalTag));
        emit MemoryTagged(ancestorName, ritual, corridor, emotionalTag);
    }
}
