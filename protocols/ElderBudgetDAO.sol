// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElderBudgetDAO {
    address public admin;

    struct BudgetEntry {
        string elderName;
        string barangayName;
        string budgetFocus;
        string emotionalTag;
        bool summoned;
        bool proposed;
        bool sealed;
    }

    BudgetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBudgetProposal(string memory elderName, string memory barangayName, string memory budgetFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(elderName, barangayName, budgetFocus, emotionalTag, true, false, false));
    }

    function confirmProposal(uint256 index) external onlyAdmin {
        entries[index].proposed = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
