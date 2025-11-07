// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TraderSentimentRecoveryManifest {
    address public steward;

    struct RecoverySignal {
        string asset;
        string sentimentShift;
        string timestamp;
        string catalyst;
        string emotionalTag;
    }

    RecoverySignal[] public manifest;

    event SentimentRecovered(string asset, string sentimentShift, string timestamp, string catalyst, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRecovery(
        string memory asset,
        string memory sentimentShift,
        string memory timestamp,
        string memory catalyst,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(RecoverySignal(asset, sentimentShift, timestamp, catalyst, emotionalTag));
        emit SentimentRecovered(asset, sentimentShift, timestamp, catalyst, emotionalTag);
    }
}
