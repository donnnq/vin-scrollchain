// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterWellnessNarrativeManifest {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string commuterType;
        string wellnessConcern;
        string proposedSolution;
        string emotionalTag;
    }

    NarrativeEntry[] public manifest;

    event CommuterWellnessNarrativeLogged(string timestamp, string commuterType, string wellnessConcern, string proposedSolution, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logNarrative(
        string memory timestamp,
        string memory commuterType,
        string memory wellnessConcern,
        string memory proposedSolution,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(NarrativeEntry(timestamp, commuterType, wellnessConcern, proposedSolution, emotionalTag));
        emit CommuterWellnessNarrativeLogged(timestamp, commuterType, wellnessConcern, proposedSolution, emotionalTag);
    }
}
