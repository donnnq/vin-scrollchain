// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTechSecurityLedger {
    string public batchID = "1321.9.176";
    string public steward = "Vinvin";

    address public admin;

    struct TechThreat {
        string company;      // Alibaba, etc.
        string risk;         // data exposure, AI misuse
        string accountability; // Pentagon, regulators
        uint256 timestamp;
    }

    TechThreat[] public threats;

    event ThreatLogged(string company, string risk, string accountability);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logThreat(string memory company, string memory risk, string memory accountability) public onlyAdmin {
        threats.push(TechThreat(company, risk, accountability, block.timestamp));
        emit ThreatLogged(company, risk, accountability);
    }

    function getThreat(uint256 index) public view returns (string memory company, string memory risk, string memory accountability, uint256 timestamp) {
        TechThreat memory t = threats[index];
        return (t.company, t.risk, t.accountability, t.timestamp);
    }
}
