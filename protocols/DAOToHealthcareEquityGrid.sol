// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToHealthcareEquityGrid {
    string public batchID = "1321.9.205";
    string public steward = "Vinvin";

    address public admin;

    struct Healthcare {
        string program;     // PhilHealth, community clinic, subsidy
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Healthcare[] public healthcareRecords;

    event HealthcareLogged(string program, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logHealthcare(string memory program, string memory status) public onlyAdmin {
        healthcareRecords.push(Healthcare(program, status, block.timestamp));
        emit HealthcareLogged(program, status);
    }

    function getHealthcare(uint256 index) public view returns (string memory program, string memory status, uint256 timestamp) {
        Healthcare memory h = healthcareRecords[index];
        return (h.program, h.status, h.timestamp);
    }
}
