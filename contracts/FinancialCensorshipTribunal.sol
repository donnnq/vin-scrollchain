// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialCensorshipTribunal {
    address public admin;

    struct TribunalEntry {
        string entityName;
        string censorshipType;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory entityName, string memory censorshipType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(entityName, censorshipType, emotionalTag, true, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
