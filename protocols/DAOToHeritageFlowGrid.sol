// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToHeritageFlowGrid {
    string public batchID = "1321.9.149";
    string public steward = "Vinvin";

    address public admin;

    struct HeritageFlow {
        string project;   // preservation project, communal resonance, equity metric
        uint256 metric;   // score or count
        uint256 timestamp;
    }

    HeritageFlow[] public flows;

    event HeritageLogged(string project, uint256 metric);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logHeritage(string memory project, uint256 metric) public onlyAdmin {
        flows.push(HeritageFlow(project, metric, block.timestamp));
        emit HeritageLogged(project, metric);
    }

    function getHeritage(uint256 index) public view returns (string memory project, uint256 metric, uint256 timestamp) {
        HeritageFlow memory h = flows[index];
        return (h.project, h.metric, h.timestamp);
    }
}
