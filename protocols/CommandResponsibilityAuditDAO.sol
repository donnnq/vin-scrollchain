// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommandResponsibilityAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string officialName;
        string role;
        string systemicHarmType;
        string omissionOrAction;
        string historicalConsequenceTag;
        string truthChoreographySignal;
    }

    AuditEntry[] public registry;

    event CommandResponsibilityAudited(string timestamp, string officialName, string role, string systemicHarmType, string omissionOrAction, string historicalConsequenceTag, string truthChoreographySignal);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditResponsibility(
        string memory timestamp,
        string memory officialName,
        string memory role,
        string memory systemicHarmType,
        string memory omissionOrAction,
        string memory historicalConsequenceTag,
        string memory truthChoreographySignal
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, officialName, role, systemicHarmType, omissionOrAction, historicalConsequenceTag, truthChoreographySignal));
        emit CommandResponsibilityAudited(timestamp, officialName, role, systemicHarmType, omissionOrAction, historicalConsequenceTag, truthChoreographySignal);
    }
}
