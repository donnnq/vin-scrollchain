// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToRiskReductionGrid {
    string public batchID = "1321.9.196";
    string public steward = "Vinvin";

    address public admin;

    struct Risk {
        string hazard;      // flood, earthquake, typhoon, fire
        string measure;     // evacuation plan, drills, hazard mapping
        uint256 timestamp;
    }

    Risk[] public risks;

    event RiskLogged(string hazard, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRisk(string memory hazard, string memory measure) public onlyAdmin {
        risks.push(Risk(hazard, measure, block.timestamp));
        emit RiskLogged(hazard, measure);
    }

    function getRisk(uint256 index) public view returns (string memory hazard, string memory measure, uint256 timestamp) {
        Risk memory r = risks[index];
        return (r.hazard, r.measure, r.timestamp);
    }
}
