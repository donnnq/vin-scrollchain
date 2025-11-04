// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectNarrativeContainmentDAO {
    address public steward;

    struct ContainmentEntry {
        string projectReference;
        string narrativeSignal;
        string containmentMechanism;
        string emotionalTag;
    }

    ContainmentEntry[] public registry;

    event NarrativeContained(string projectReference, string narrativeSignal, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory projectReference,
        string memory narrativeSignal,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ContainmentEntry(projectReference, narrativeSignal, containmentMechanism, emotionalTag));
        emit NarrativeContained(projectReference, narrativeSignal, containmentMechanism, emotionalTag);
    }
}
