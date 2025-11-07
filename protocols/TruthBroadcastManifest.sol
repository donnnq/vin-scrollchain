// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthBroadcastManifest {
    address public steward;

    struct TruthEntry {
        string title;
        string broadcaster;
        string timestamp;
        string verificationSource;
        string emotionalTag;
    }

    TruthEntry[] public manifest;

    event TruthBroadcasted(string title, string broadcaster, string timestamp, string verificationSource, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTruth(
        string memory title,
        string memory broadcaster,
        string memory timestamp,
        string memory verificationSource,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(TruthEntry(title, broadcaster, timestamp, verificationSource, emotionalTag));
        emit TruthBroadcasted(title, broadcaster, timestamp, verificationSource, emotionalTag);
    }
}
