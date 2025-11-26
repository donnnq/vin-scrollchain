// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToDefenseFlowGrid {
    string public batchID = "1321.9.139";
    string public steward = "Vinvin";

    address public admin;

    struct DefenseFlow {
        string system;      // AI system name
        string dataset;     // dataset being tracked
        uint256 resilienceScore; // custom metric
        uint256 timestamp;
    }

    DefenseFlow[] public flows;

    event DefenseLogged(string system, string dataset, uint256 resilienceScore);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDefense(string memory system, string memory dataset, uint256 resilienceScore) public onlyAdmin {
        flows.push(DefenseFlow(system, dataset, resilienceScore, block.timestamp));
        emit DefenseLogged(system, dataset, resilienceScore);
    }

    function getDefense(uint256 index) public view returns (string memory system, string memory dataset, uint256 resilienceScore, uint256 timestamp) {
        DefenseFlow memory d = flows[index];
        return (d.system, d.dataset, d.resilienceScore, d.timestamp);
    }
}
