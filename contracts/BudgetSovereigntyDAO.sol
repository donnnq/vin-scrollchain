// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetSovereigntyDAO {
    address public admin;

    struct BudgetEntry {
        string agency;
        uint256 allocatedAmount;
        uint256 spentAmount;
        bool audited;
    }

    BudgetEntry[] public budgets;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBudget(string memory _agency, uint256 _allocatedAmount, uint256 _spentAmount) external onlyAdmin {
        budgets.push(BudgetEntry(_agency, _allocatedAmount, _spentAmount, false));
    }

    function markAudited(uint256 index) external onlyAdmin {
        budgets[index].audited = true;
    }

    function getBudget(uint256 index) external view returns (BudgetEntry memory) {
        return budgets[index];
    }
}
