// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodMemoryCodex {
    address public admin;

    struct MemoryEntry {
        string dishName;
        string memoryOrigin;
        string comfortClause;
        string emotionalTag;
        bool summoned;
        bool honored;
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

    function summonMemory(string memory dishName, string memory memoryOrigin, string memory comfortClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MemoryEntry(dishName, memoryOrigin, comfortClause, emotionalTag, true, false, false));
    }

    function confirmHonor(uint256 index) external onlyAdmin {
        entries[index].honored = true;
    }

    function sealMemoryEntry(uint256 index) external onlyAdmin {
        require(entries[index].honored, "Must be honored first");
        entries[index].sealed = true;
    }

    function getMemoryEntry(uint256 index) external view returns (MemoryEntry memory) {
        return entries[index];
    }
}
