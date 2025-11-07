// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateJusticeBroadcastManifest {
    address public steward;

    struct Broadcast {
        string region;
        string timestamp;
        string message;
        string speaker;
        string emotionalTag;
    }

    Broadcast[] public manifest;

    event JusticeBroadcasted(string region, string timestamp, string message, string speaker, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory region,
        string memory timestamp,
        string memory message,
        string memory speaker,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(Broadcast(region, timestamp, message, speaker, emotionalTag));
        emit JusticeBroadcasted(region, timestamp, message, speaker, emotionalTag);
    }
}
