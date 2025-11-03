// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MallMemoryDAO {
    address public steward;

    struct MemoryEntry {
        string mallName;
        string nostalgicElement;
        string emotionalImpact;
        string emotionalTag;
    }

    MemoryEntry[] public registry;

    event MallMemoryTagged(string mallName, string nostalgicElement, string emotionalImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMemory(
        string memory mallName,
        string memory nostalgicElement,
        string memory emotionalImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MemoryEntry(mallName, nostalgicElement, emotionalImpact, emotionalTag));
        emit MallMemoryTagged(mallName, nostalgicElement, emotionalImpact, emotionalTag);
    }
}
