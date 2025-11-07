// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodplainZoningDisciplineAudit {
    address public steward;

    struct ZoningAudit {
        string barangay;
        string timestamp;
        string zoningViolation;
        string floodRiskLevel;
        string emotionalTag;
    }

    ZoningAudit[] public audits;

    event ZoningViolationFlagged(string barangay, string timestamp, string zoningViolation, string floodRiskLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagViolation(
        string memory barangay,
        string memory timestamp,
        string memory zoningViolation,
        string memory floodRiskLevel,
        string memory emotionalTag
    ) public onlySteward {
        audits.push(ZoningAudit(barangay, timestamp, zoningViolation, floodRiskLevel, emotionalTag));
        emit ZoningViolationFlagged(barangay, timestamp, zoningViolation, floodRiskLevel, emotionalTag);
    }
}
