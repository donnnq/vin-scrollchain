// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTrainingSystemsAuditLedger {
    string public batchID = "1321.9.233";
    string public steward = "Vinvin";

    address public admin;

    struct Training {
        string system;      // apprenticeship, online course, mentorship
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Training[] public trainings;

    event TrainingLogged(string system, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTraining(string memory system, string memory status) public onlyAdmin {
        trainings.push(Training(system, status, block.timestamp));
        emit TrainingLogged(system, status);
    }

    function getTraining(uint256 index) public view returns (string memory system, string memory status, uint256 timestamp) {
        Training memory t = trainings[index];
        return (t.system, t.status, t.timestamp);
    }
}
