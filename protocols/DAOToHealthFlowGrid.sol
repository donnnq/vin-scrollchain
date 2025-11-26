// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToHealthFlowGrid {
    string public batchID = "1321.9.146";
    string public steward = "Vinvin";

    address public admin;

    struct HealthFlow {
        string metric; // hospital capacity, nurse migration, wellness
        uint256 value;
        uint256 timestamp;
    }

    HealthFlow[] public flows;

    event HealthLogged(string metric, uint256 value);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logHealth(string memory metric, uint256 value) public onlyAdmin {
        flows.push(HealthFlow(metric, value, block.timestamp));
        emit HealthLogged(metric, value);
    }

    function getHealth(uint256 index) public view returns (string memory metric, uint256 value, uint256 timestamp) {
        HealthFlow memory h = flows[index];
        return (h.metric, h.value, h.timestamp);
    }
}
