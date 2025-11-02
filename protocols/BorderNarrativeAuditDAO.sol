// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderNarrativeAuditDAO {
    address public steward;

    struct NarrativeEntry {
        string source;
        string crisisLabel;
        string impactSummary;
        string emotionalTag;
    }

    NarrativeEntry[] public registry;

    event BorderNarrativeAudited(string source, string crisisLabel, string impactSummary, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditNarrative(
        string memory source,
        string memory crisisLabel,
        string memory impactSummary,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(NarrativeEntry(source, crisisLabel, impactSummary, emotionalTag));
        emit BorderNarrativeAudited(source, crisisLabel, impactSummary, emotionalTag);
    }
}
