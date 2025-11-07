// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BurrySignalBroadcastTreaty {
    address public steward;

    struct Broadcast {
        string assetTargeted;
        string signalType;
        string timestamp;
        string rationale;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event BurrySignalBroadcasted(string assetTargeted, string signalType, string timestamp, string rationale, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSignal(
        string memory assetTargeted,
        string memory signalType,
        string memory timestamp,
        string memory rationale,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(assetTargeted, signalType, timestamp, rationale, emotionalTag));
        emit BurrySignalBroadcasted(assetTargeted, signalType, timestamp, rationale, emotionalTag);
    }
}
