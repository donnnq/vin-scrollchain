// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalMaritimeMemoryProtocol {
    address public admin;

    struct MemoryEntry {
        string waterwayName;
        string historicalEvent;
        string memoryClause;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    MemoryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMemory(string memory waterwayName, string memory historicalEvent, string memory memoryClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MemoryEntry(waterwayName, historicalEvent, memoryClause, emotionalTag, true, false, false));
    }

    function confirmArchiving(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealMemoryEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
