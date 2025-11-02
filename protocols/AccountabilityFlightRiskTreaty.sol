// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountabilityFlightRiskTreaty {
    address public steward;

    struct RiskClause {
        string officialName;
        string investigationStatus;
        string mobilityRestriction;
        string emotionalTag;
    }

    RiskClause[] public treatyLog;

    event FlightRiskTagged(string officialName, string investigationStatus, string mobilityRestriction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFlightRisk(
        string memory officialName,
        string memory investigationStatus,
        string memory mobilityRestriction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RiskClause(officialName, investigationStatus, mobilityRestriction, emotionalTag));
        emit FlightRiskTagged(officialName, investigationStatus, mobilityRestriction, emotionalTag);
    }
}
