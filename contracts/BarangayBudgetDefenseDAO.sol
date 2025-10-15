// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBudgetDefenseDAO {
    address public admin;

    struct DefenseEntry {
        string purokOrBarangay;
        string budgetConcern;
        string defenseClause;
        string emotionalTag;
        bool activated;
    }

    DefenseEntry[] public defenses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDefense(string memory _purokOrBarangay, string memory _budgetConcern, string memory _defenseClause, string memory _emotionalTag) external onlyAdmin {
        defenses.push(DefenseEntry(_purokOrBarangay, _budgetConcern, _defenseClause, _emotionalTag, false));
    }

    function activateDefense(uint256 index) external onlyAdmin {
        defenses[index].activated = true;
    }

    function getDefense(uint256 index) external view returns (DefenseEntry memory) {
        return defenses[index];
    }
}
