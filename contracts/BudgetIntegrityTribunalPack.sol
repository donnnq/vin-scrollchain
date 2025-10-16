// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetIntegrityTribunalPack {
    address public admin;

    struct TribunalEntry {
        string caseLabel;
        string tribunalMessage;
        string emotionalTag;
        bool convened;
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

    function conveneTribunal(string memory caseLabel, string memory tribunalMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(caseLabel, tribunalMessage, emotionalTag, true, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
