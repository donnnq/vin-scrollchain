// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicGreeningSentimentBroadcastManifest {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string location;
        string greeningInitiative;
        string publicSentiment;
        string civicEngagementSignal;
        string emotionalTag;
    }

    BroadcastEntry[] public manifest;

    event GreeningSentimentBroadcasted(string timestamp, string location, string greeningInitiative, string publicSentiment, string civicEngagementSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSentiment(
        string memory timestamp,
        string memory location,
        string memory greeningInitiative,
        string memory publicSentiment,
        string memory civicEngagementSignal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(BroadcastEntry(timestamp, location, greeningInitiative, publicSentiment, civicEngagementSignal, emotionalTag));
        emit GreeningSentimentBroadcasted(timestamp, location, greeningInitiative, publicSentiment, civicEngagementSignal, emotionalTag);
    }
}
