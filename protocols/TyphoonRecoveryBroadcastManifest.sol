// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TyphoonRecoveryBroadcastManifest {
    address public steward;

    struct Broadcast {
        string region;
        string message;
        string timestamp;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event RecoveryBroadcasted(string region, string message, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRecovery(
        string memory region,
        string memory message,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(region, message, timestamp, emotionalTag));
        emit RecoveryBroadcasted(region, message, timestamp, emotionalTag);
    }
}
