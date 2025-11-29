// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToRiskScanningLedger {
    string public batchID = "1321.9.180";
    string public steward = "Vinvin";

    address public admin;

    struct RiskScan {
        string sector;       // physical, digital, supply chain
        string finding;      // anomaly, redundancy, cleared
        uint256 timestamp;
    }

    RiskScan[] public scans;

    event ScanLogged(string sector, string finding);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logScan(string memory sector, string memory finding) public onlyAdmin {
        scans.push(RiskScan(sector, finding, block.timestamp));
        emit ScanLogged(sector, finding);
    }

    function getScan(uint256 index) public view returns (string memory sector, string memory finding, uint256 timestamp) {
        RiskScan memory r = scans[index];
        return (r.sector, r.finding, r.timestamp);
    }
}
