// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTeacherDignityAuditLedger {
    string public batchID = "1321.9.225";
    string public steward = "Vinvin";

    address public admin;

    struct Teacher {
        string name;        // educator, mentor, professor
        string status;      // dignified, pending, ghost
        uint256 timestamp;
    }

    Teacher[] public teachers;

    event TeacherLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTeacher(string memory name, string memory status) public onlyAdmin {
        teachers.push(Teacher(name, status, block.timestamp));
        emit TeacherLogged(name, status);
    }

    function getTeacher(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Teacher memory t = teachers[index];
        return (t.name, t.status, t.timestamp);
    }
}
