// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToProjectVerificationGrid {
    string public batchID = "1321.9.187";
    string public steward = "Vinvin";

    address public admin;

    struct Project {
        string name;        // road, bridge, flood control
        string status;      // verified, ghost, pending
        uint256 timestamp;
    }

    Project[] public projects;

    event ProjectLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logProject(string memory name, string memory status) public onlyAdmin {
        projects.push(Project(name, status, block.timestamp));
        emit ProjectLogged(name, status);
    }

    function getProject(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Project memory p = projects[index];
        return (p.name, p.status, p.timestamp);
    }
}
