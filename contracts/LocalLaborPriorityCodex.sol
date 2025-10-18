// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalLaborPriorityCodex {
    address public admin;

    struct PriorityEntry {
        string region;
        string laborType;
        string emotionalTag;
        bool summoned;
        bool prioritized;
    }

    PriorityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPriority(string memory region, string memory laborType, string memory emotionalTag) external onlyAdmin {
        entries.push(PriorityEntry(region, laborType, emotionalTag, true, false));
    }

    function prioritizeLabor(uint256 index) external onlyAdmin {
        entries[index].prioritized = true;
    }

    function getPriorityEntry(uint256 index) external view returns (PriorityEntry memory) {
        return entries[index];
    }
}
