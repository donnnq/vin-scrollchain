// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBudgetImmunityDAO {
    address public admin;

    struct BudgetEntry {
        string purokOrBarangay;
        string budgetFocus;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    BudgetEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _budgetFocus, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(BudgetEntry(_purokOrBarangay, _budgetFocus, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        registry[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (BudgetEntry memory) {
        return registry[index];
    }
}
