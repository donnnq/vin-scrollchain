// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeContainmentCodex {
    address public steward;

    struct ContainmentEntry {
        string narrativeReference;
        string containmentSignal;
        string codexMechanism;
        string emotionalTag;
    }

    ContainmentEntry[] public codex;

    event NarrativeContained(string narrativeReference, string containmentSignal, string codexMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory narrativeReference,
        string memory containmentSignal,
        string memory codexMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ContainmentEntry(narrativeReference, containmentSignal, codexMechanism, emotionalTag));
        emit NarrativeContained(narrativeReference, containmentSignal, codexMechanism, emotionalTag);
    }
}
