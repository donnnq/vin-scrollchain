// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCurriculumEquityGrid {
    string public batchID = "1321.9.225";
    string public steward = "Vinvin";

    address public admin;

    struct Curriculum {
        string subject;     // math, science, arts
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Curriculum[] public curricula;

    event CurriculumLogged(string subject, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCurriculum(string memory subject, string memory status) public onlyAdmin {
        curricula.push(Curriculum(subject, status, block.timestamp));
        emit CurriculumLogged(subject, status);
    }

    function getCurriculum(uint256 index) public view returns (string memory subject, string memory status, uint256 timestamp) {
        Curriculum memory c = curricula[index];
        return (c.subject, c.status, c.timestamp);
    }
}
