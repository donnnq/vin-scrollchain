// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthBudgetDefenseDAO {
    address public admin;

    struct DefenseEntry {
        string purokOrBarangay;
        string budgetFocus;
        string defenseClause;
        string emotionalTag;
        bool deployed;
    }

    DefenseEntry[] public defenses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _budgetFocus, string memory _defenseClause, string memory _emotionalTag) external onlyAdmin {
        defenses.push(DefenseEntry(_purokOrBarangay, _budgetFocus, _defenseClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        defenses[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (DefenseEntry memory) {
        return defenses[index];
    }
}
