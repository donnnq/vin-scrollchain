// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TherapyBudgetDAO {
    address public admin;

    struct BudgetEntry {
        string region;
        uint256 allocatedAmount;
        string therapyType;
        string emotionalTag;
        bool summoned;
        bool approved;
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

    function summonBudget(string memory region, uint256 allocatedAmount, string memory therapyType, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(region, allocatedAmount, therapyType, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
