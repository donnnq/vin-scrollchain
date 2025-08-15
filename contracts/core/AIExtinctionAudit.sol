// SPDX-License-Identifier: CivicGuardian
pragma solidity ^0.8.0;

contract AIExtinctionAudit {
    struct RiskLog {
        string threat;
        string emotionalImpact;
        string mitigation;
        uint256 timestamp;
    }

    RiskLog[] public logs;

    event RiskLogged(string threat, string impact, string mitigation);

    function logRisk(string memory threat, string memory impact, string memory mitigation) public {
        logs.push(RiskLog(threat, impact, mitigation, block.timestamp));
        emit RiskLogged(threat, impact, mitigation);
    }

    function getLog(uint index) public view returns (RiskLog memory) {
        require(index < logs.length, "Invalid index");
        return logs[index];
    }
}
