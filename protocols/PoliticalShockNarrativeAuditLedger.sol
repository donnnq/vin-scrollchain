// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalShockNarrativeAuditLedger {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string title;
        string sourceChannel;
        string accuracyAssessment;
        string civicImpact;
        string emotionalTag;
    }

    NarrativeEntry[] public ledger;

    event ShockNarrativeAudited(string timestamp, string title, string sourceChannel, string accuracyAssessment, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditNarrative(
        string memory timestamp,
        string memory title,
        string memory sourceChannel,
        string memory accuracyAssessment,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(NarrativeEntry(timestamp, title, sourceChannel, accuracyAssessment, civicImpact, emotionalTag));
        emit ShockNarrativeAudited(timestamp, title, sourceChannel, accuracyAssessment, civicImpact, emotionalTag);
    }
}
