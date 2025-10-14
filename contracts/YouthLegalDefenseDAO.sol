// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLegalDefenseDAO {
    address public admin;

    struct DefenseEntry {
        string purokOrBarangay;
        string legalThreat;
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

    function submitDefense(string memory _purokOrBarangay, string memory _legalThreat, string memory _defenseClause, string memory _emotionalTag) external onlyAdmin {
        defenses.push(DefenseEntry(_purokOrBarangay, _legalThreat, _defenseClause, _emotionalTag, false));
    }

    function deployDefense(uint256 index) external onlyAdmin {
        defenses[index].deployed = true;
    }

    function getDefense(uint256 index) external view returns (DefenseEntry memory) {
        return defenses[index];
    }
}
