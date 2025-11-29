// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTeacherDignityLedger {
    string public batchID = "1321.9.190";
    string public steward = "Vinvin";

    address public admin;

    struct Teacher {
        string name;
        string dignityMeasure;   // fair pay, respect, workload balance
        uint256 timestamp;
    }

    Teacher[] public teachers;

    event TeacherLogged(string name, string dignityMeasure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTeacher(string memory name, string memory dignityMeasure) public onlyAdmin {
        teachers.push(Teacher(name, dignityMeasure, block.timestamp));
        emit TeacherLogged(name, dignityMeasure);
    }

    function getTeacher(uint256 index) public view returns (string memory name, string memory dignityMeasure, uint256 timestamp) {
        Teacher memory t = teachers[index];
        return (t.name, t.dignityMeasure, t.timestamp);
    }
}
