// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeContainmentTreaty {
    address public steward;

    struct ContainmentEntry {
        string narrativeID;
        string source;
        string corridor;
        string auditTag;
    }

    ContainmentEntry[] public ledger;

    event NarrativeContained(string narrativeID, string source, string corridor, string auditTag);
    event HypocrisyAuditTriggered(string narrativeID, string reason);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function containNarrative(
        string memory narrativeID,
        string memory source,
        string memory corridor,
        string memory auditTag
    ) public onlySteward {
        ledger.push(ContainmentEntry(narrativeID, source, corridor, auditTag));
        emit NarrativeContained(narrativeID, source, corridor, auditTag);
    }

    function triggerHypocrisyAudit(string memory narrativeID, string memory reason) public onlySteward {
        emit HypocrisyAuditTriggered(narrativeID, reason);
    }
}
