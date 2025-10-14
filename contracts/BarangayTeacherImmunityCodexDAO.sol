// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTeacherImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string teacherName;
        string barangay;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerTeacher(string memory _teacherName, string memory _barangay, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_teacherName, _barangay, _immunityClause, _emotionalTag, false));
    }

    function protectTeacher(uint256 index) external onlyAdmin {
        codex[index].protected = true;
    }

    function getTeacher(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
