// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AquacultureTrainingBroadcastCodex {
    address public steward;

    struct TrainingClause {
        string location;
        string trainingTopic;
        string broadcastChannel;
        string emotionalTag;
    }

    TrainingClause[] public codex;

    event TrainingBroadcasted(string location, string trainingTopic, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTraining(
        string memory location,
        string memory trainingTopic,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TrainingClause(location, trainingTopic, broadcastChannel, emotionalTag));
        emit TrainingBroadcasted(location, trainingTopic, broadcastChannel, emotionalTag);
    }
}
