// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToClimateRiskGrid {
    string public batchID = "1321.9.168";
    string public steward = "Vinvin";

    address public admin;

    struct ClimateRisk {
        string hazard;      // flood, heatwave, typhoon
        string location;    // city, province, region
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    ClimateRisk[] public risks;

    event RiskLogged(string hazard, string location, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRisk(string memory hazard, string memory location, uint256 severity) public onlyAdmin {
        risks.push(ClimateRisk(hazard, location, severity, block.timestamp));
        emit RiskLogged(hazard, location, severity);
    }

    function getRisk(uint256 index) public view returns (string memory hazard, string memory location, uint256 severity, uint256 timestamp) {
        ClimateRisk memory r = risks[index];
        return (r.hazard, r.location, r.severity, r.timestamp);
    }
}
