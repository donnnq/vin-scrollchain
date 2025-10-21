// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanMemoryProtocol {
    address public admin;

    struct MemoryEntry {
        string city;
        string memoryType; // "Vendor History", "Street Transformation", "Public Sentiment"
        string protocolClause;
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

    function summonMemory(string memory city, string memory memoryType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MemoryEntry(city, memoryType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmArchival(uint256 index) external onlyAdmin {
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
