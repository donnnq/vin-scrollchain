// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPrivacyRiskGrid {
    string public batchID = "1321.9.173";
    string public steward = "Vinvin";

    address public admin;

    struct PrivacyRisk {
        string domain;      // data handling, surveillance, corporate practice
        string issue;       // unauthorized access, consent violation, opaque collection
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    PrivacyRisk[] public risks;

    event RiskLogged(string domain, string issue, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRisk(string memory domain, string memory issue, uint256 severity) public onlyAdmin {
        risks.push(PrivacyRisk(domain, issue, severity, block.timestamp));
        emit RiskLogged(domain, issue, severity);
    }

    function getRisk(uint256 index) public view returns (string memory domain, string memory issue, uint256 severity, uint256 timestamp) {
        PrivacyRisk memory r = risks[index];
        return (r.domain, r.issue, r.severity, r.timestamp);
    }
}
