// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthChoreographyNarrativeIndex {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string eventOrPolicy;
        string truthSignal;
        string narrativeType;
        string emotionalTag;
    }

    NarrativeEntry[] public index;

    event TruthNarrativeIndexed(string timestamp, string eventOrPolicy, string truthSignal, string narrativeType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexNarrative(
        string memory timestamp,
        string memory eventOrPolicy,
        string memory truthSignal,
        string memory narrativeType,
        string memory emotionalTag
    ) public onlySteward {
        index.push(NarrativeEntry(timestamp, eventOrPolicy, truthSignal, narrativeType, emotionalTag));
        emit TruthNarrativeIndexed(timestamp, eventOrPolicy, truthSignal, narrativeType, emotionalTag);
    }
}
