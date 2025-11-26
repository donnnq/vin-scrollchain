// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToMediaFlowGrid {
    string public batchID = "1321.9.148";
    string public steward = "Vinvin";

    address public admin;

    struct MediaFlow {
        string coverage;   // headline, framing, communal resonance
        uint256 metric;    // resonance score or count
        uint256 timestamp;
    }

    MediaFlow[] public flows;

    event MediaLogged(string coverage, uint256 metric);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMedia(string memory coverage, uint256 metric) public onlyAdmin {
        flows.push(MediaFlow(coverage, metric, block.timestamp));
        emit MediaLogged(coverage, metric);
    }

    function getMedia(uint256 index) public view returns (string memory coverage, uint256 metric, uint256 timestamp) {
        MediaFlow memory m = flows[index];
        return (m.coverage, m.metric, m.timestamp);
    }
}
