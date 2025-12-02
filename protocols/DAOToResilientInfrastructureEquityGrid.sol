// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToResilientInfrastructureEquityGrid {
    string public batchID = "1321.9.224";
    string public steward = "Vinvin";

    address public admin;

    struct Infrastructure {
        string project;     // flood control, renewable energy, coastal defense
        string status;      // resilient, pending, ghost
        uint256 timestamp;
    }

    Infrastructure[] public infrastructures;

    event InfrastructureLogged(string project, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logInfrastructure(string memory project, string memory status) public onlyAdmin {
        infrastructures.push(Infrastructure(project, status, block.timestamp));
        emit InfrastructureLogged(project, status);
    }

    function getInfrastructure(uint256 index) public view returns (string memory project, string memory status, uint256 timestamp) {
        Infrastructure memory i = infrastructures[index];
        return (i.project, i.status, i.timestamp);
    }
}
