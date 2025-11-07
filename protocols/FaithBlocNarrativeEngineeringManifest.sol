// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithBlocNarrativeEngineeringManifest {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string faithBloc;
        string mediaEvent;
        string narrativeIntent;
        string publicImageGoal;
        string emotionalTag;
    }

    NarrativeEntry[] public manifest;

    event NarrativeEngineered(string timestamp, string faithBloc, string mediaEvent, string narrativeIntent, string publicImageGoal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function engineerNarrative(
        string memory timestamp,
        string memory faithBloc,
        string memory mediaEvent,
        string memory narrativeIntent,
        string memory publicImageGoal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(NarrativeEntry(timestamp, faithBloc, mediaEvent, narrativeIntent, publicImageGoal, emotionalTag));
        emit NarrativeEngineered(timestamp, faithBloc, mediaEvent, narrativeIntent, publicImageGoal, emotionalTag);
    }
}
