// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCrisisNarrativeAccuracyManifest {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string eventTitle;
        string source;
        string accuracyAssessment;
        string globalImpact;
        string emotionalTag;
    }

    NarrativeEntry[] public manifest;

    event CrisisNarrativeLogged(string timestamp, string eventTitle, string source, string accuracyAssessment, string globalImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logNarrative(
        string memory timestamp,
        string memory eventTitle,
        string memory source,
        string memory accuracyAssessment,
        string memory globalImpact,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(NarrativeEntry(timestamp, eventTitle, source, accuracyAssessment, globalImpact, emotionalTag));
        emit CrisisNarrativeLogged(timestamp, eventTitle, source, accuracyAssessment, globalImpact, emotionalTag);
    }
}
