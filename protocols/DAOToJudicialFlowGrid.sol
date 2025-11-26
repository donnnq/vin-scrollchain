// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToJudicialFlowGrid {
    string public batchID = "1321.9.153";
    string public steward = "Vinvin";

    address public admin;

    struct JudicialFlow {
        string official;   // judge, justice
        string anomaly;    // misconduct, irregular ruling
        uint256 timestamp;
    }

    JudicialFlow[] public flows;

    event JudicialLogged(string official, string anomaly);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logJudicial(string memory official, string memory anomaly) public onlyAdmin {
        flows.push(JudicialFlow(official, anomaly, block.timestamp));
        emit JudicialLogged(official, anomaly);
    }

    function getJudicial(uint256 index) public view returns (string memory official, string memory anomaly, uint256 timestamp) {
        JudicialFlow memory j = flows[index];
        return (j.official, j.anomaly, j.timestamp);
    }
}
