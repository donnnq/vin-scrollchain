// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToEquityFlowGrid {
    string public batchID = "1321.9.151";
    string public steward = "Vinvin";

    address public admin;

    struct EquityFlow {
        string initiative;   // vaccine access, treatment distribution
        uint256 metric;      // communal health score or count
        uint256 timestamp;
    }

    EquityFlow[] public flows;

    event EquityLogged(string initiative, uint256 metric);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEquity(string memory initiative, uint256 metric) public onlyAdmin {
        flows.push(EquityFlow(initiative, metric, block.timestamp));
        emit EquityLogged(initiative, metric);
    }

    function getEquity(uint256 index) public view returns (string memory initiative, uint256 metric, uint256 timestamp) {
        EquityFlow memory e = flows[index];
        return (e.initiative, e.metric, e.timestamp);
    }
}
