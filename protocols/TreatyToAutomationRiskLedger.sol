// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAutomationRiskLedger {
    string public batchID = "1321.9.204";
    string public steward = "Vinvin";

    address public admin;

    struct Risk {
        string sector;      // hospitality, retail, transport
        string level;       // high, medium, low
        uint256 timestamp;
    }

    Risk[] public risks;

    event RiskLogged(string sector, string level);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRisk(string memory sector, string memory level) public onlyAdmin {
        risks.push(Risk(sector, level, block.timestamp));
        emit RiskLogged(sector, level);
    }

    function getRisk(uint256 index) public view returns (string memory sector, string memory level, uint256 timestamp) {
        Risk memory r = risks[index];
        return (r.sector, r.level, r.timestamp);
    }
}
