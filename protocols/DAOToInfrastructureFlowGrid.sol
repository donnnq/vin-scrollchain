// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToInfrastructureFlowGrid {
    string public batchID = "1321.9.140";
    string public steward = "Vinvin";

    address public admin;

    struct InfraFlow {
        string asset; // energy grid, transport, water system
        uint256 capacity;
        uint256 resilienceScore;
        uint256 timestamp;
    }

    InfraFlow[] public flows;

    event InfraLogged(string asset, uint256 capacity, uint256 resilienceScore);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logInfra(string memory asset, uint256 capacity, uint256 resilienceScore) public onlyAdmin {
        flows.push(InfraFlow(asset, capacity, resilienceScore, block.timestamp));
        emit InfraLogged(asset, capacity, resilienceScore);
    }

    function getInfra(uint256 index) public view returns (string memory asset, uint256 capacity, uint256 resilienceScore, uint256 timestamp) {
        InfraFlow memory f = flows[index];
        return (f.asset, f.capacity, f.resilienceScore, f.timestamp);
    }
}
