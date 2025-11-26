// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToScanFlowGrid {
    string public batchID = "1321.9.152";
    string public steward = "Vinvin";

    address public admin;

    struct ScanFlow {
        string official;   // House Representative, Vice President, Mayor, Governor
        string anomaly;    // conflict of interest, procurement irregularity
        uint256 timestamp;
    }

    ScanFlow[] public scans;

    event ScanLogged(string official, string anomaly);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logScan(string memory official, string memory anomaly) public onlyAdmin {
        scans.push(ScanFlow(official, anomaly, block.timestamp));
        emit ScanLogged(official, anomaly);
    }

    function getScan(uint256 index) public view returns (string memory official, string memory anomaly, uint256 timestamp) {
        ScanFlow memory s = scans[index];
        return (s.official, s.anomaly, s.timestamp);
    }
}
