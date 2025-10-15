// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIEmpowermentImmunityPackDAO {
    address public admin;

    struct EmpowermentEntry {
        string reformLabel;
        string immunityClause;
        string emotionalTag;
        bool activated;
    }

    EmpowermentEntry[] public pack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _reformLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        pack.push(EmpowermentEntry(_reformLabel, _immunityClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        pack[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (EmpowermentEntry memory) {
        return pack[index];
    }
}
