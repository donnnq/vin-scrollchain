// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLearningSystemsAuditLedger {
    string public batchID = "1321.9.237";
    string public steward = "Vinvin";

    address public admin;

    struct LearningSystem {
        string system;      // public school, private academy, online platform
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    LearningSystem[] public systems;

    event LearningSystemLogged(string system, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSystem(string memory system, string memory status) public onlyAdmin {
        systems.push(LearningSystem(system, status, block.timestamp));
        emit LearningSystemLogged(system, status);
    }

    function getSystem(uint256 index) public view returns (string memory system, string memory status, uint256 timestamp) {
        LearningSystem memory s = systems[index];
        return (s.system, s.status, s.timestamp);
    }
}
