// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailReentrySignalBroadcast {
    address public steward;

    struct ReentrySignal {
        string platform;
        string asset;
        string timestamp;
        string signalType;
        string emotionalTag;
    }

    ReentrySignal[] public broadcasts;

    event RetailReentryBroadcasted(string platform, string asset, string timestamp, string signalType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastReentry(
        string memory platform,
        string memory asset,
        string memory timestamp,
        string memory signalType,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(ReentrySignal(platform, asset, timestamp, signalType, emotionalTag));
        emit RetailReentryBroadcasted(platform, asset, timestamp, signalType, emotionalTag);
    }
}
