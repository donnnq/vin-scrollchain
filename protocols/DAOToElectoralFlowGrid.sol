// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToElectoralFlowGrid {
    string public batchID = "1321.9.154";
    string public steward = "Vinvin";

    address public admin;

    struct ElectoralFlow {
        string candidate;   // campaign finance, disclosure
        string anomaly;     // irregularity, communal resonance
        uint256 timestamp;
    }

    ElectoralFlow[] public flows;

    event ElectoralLogged(string candidate, string anomaly);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logElectoral(string memory candidate, string memory anomaly) public onlyAdmin {
        flows.push(ElectoralFlow(candidate, anomaly, block.timestamp));
        emit ElectoralLogged(candidate, anomaly);
    }

    function getElectoral(uint256 index) public view returns (string memory candidate, string memory anomaly, uint256 timestamp) {
        ElectoralFlow memory e = flows[index];
        return (e.candidate, e.anomaly, e.timestamp);
    }
}
