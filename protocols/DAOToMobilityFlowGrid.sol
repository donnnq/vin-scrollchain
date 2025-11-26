// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToMobilityFlowGrid {
    string public batchID = "1321.9.145";
    string public steward = "Vinvin";

    address public admin;

    struct MobilityFlow {
        string reform; // transport reform, commuter dignity, access
        uint256 metric; // communal score or count
        uint256 timestamp;
    }

    MobilityFlow[] public flows;

    event MobilityLogged(string reform, uint256 metric);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMobility(string memory reform, uint256 metric) public onlyAdmin {
        flows.push(MobilityFlow(reform, metric, block.timestamp));
        emit MobilityLogged(reform, metric);
    }

    function getMobility(uint256 index) public view returns (string memory reform, uint256 metric, uint256 timestamp) {
        MobilityFlow memory m = flows[index];
        return (m.reform, m.metric, m.timestamp);
    }
}
