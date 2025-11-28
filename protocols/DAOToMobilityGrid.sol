// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToMobilityGrid {
    string public batchID = "1321.9.163";
    string public steward = "Vinvin";

    address public admin;

    struct MobilityMetric {
        string line;        // LRT1, LRT2, MRT3
        string indicator;   // congestion, frequency, equity
        uint256 value;      // numeric measure
        uint256 timestamp;
    }

    MobilityMetric[] public metrics;

    event MetricLogged(string line, string indicator, uint256 value);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMetric(string memory line, string memory indicator, uint256 value) public onlyAdmin {
        metrics.push(MobilityMetric(line, indicator, value, block.timestamp));
        emit MetricLogged(line, indicator, value);
    }

    function getMetric(uint256 index) public view returns (string memory line, string memory indicator, uint256 value, uint256 timestamp) {
        MobilityMetric memory m = metrics[index];
        return (m.line, m.indicator, m.value, m.timestamp);
    }
}
