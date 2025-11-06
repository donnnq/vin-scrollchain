// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RapidRoadCompletionDAO {
    address public steward;

    struct CompletionEntry {
        string roadName;
        string urgencySignal;
        string completionProtocol;
        string emotionalTag;
    }

    CompletionEntry[] public registry;

    event RoadCompletionBroadcasted(string roadName, string urgencySignal, string completionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCompletion(
        string memory roadName,
        string memory urgencySignal,
        string memory completionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CompletionEntry(roadName, urgencySignal, completionProtocol, emotionalTag));
        emit RoadCompletionBroadcasted(roadName, urgencySignal, completionProtocol, emotionalTag);
    }
}
