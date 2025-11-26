// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToEducationFlowGrid {
    string public batchID = "1321.9.144";
    string public steward = "Vinvin";

    address public admin;

    struct EducationFlow {
        string reform; // curriculum, teacher dignity, access
        uint256 metric; // communal score or count
        uint256 timestamp;
    }

    EducationFlow[] public flows;

    event EducationLogged(string reform, uint256 metric);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEducation(string memory reform, uint256 metric) public onlyAdmin {
        flows.push(EducationFlow(reform, metric, block.timestamp));
        emit EducationLogged(reform, metric);
    }

    function getEducation(uint256 index) public view returns (string memory reform, uint256 metric, uint256 timestamp) {
        EducationFlow memory e = flows[index];
        return (e.reform, e.metric, e.timestamp);
    }
}
