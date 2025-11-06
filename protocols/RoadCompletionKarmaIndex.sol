// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RoadCompletionKarmaIndex {
    address public steward;

    struct CompletionEntry {
        string roadName;
        string completionStatus;
        string karmaSignal;
        string emotionalTag;
    }

    CompletionEntry[] public index;

    event RoadCompletionTagged(string roadName, string completionStatus, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCompletion(
        string memory roadName,
        string memory completionStatus,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(CompletionEntry(roadName, completionStatus, karmaSignal, emotionalTag));
        emit RoadCompletionTagged(roadName, completionStatus, karmaSignal, emotionalTag);
    }
}
