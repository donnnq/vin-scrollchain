// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoseidonCounterMythBroadcastManifest {
    address public steward;

    struct Broadcast {
        string mythID;
        string timestamp;
        string counterMyth;
        string emotionalTag;
        string soundtrack;
    }

    Broadcast[] public manifest;

    event CounterMythBroadcasted(string mythID, string timestamp, string counterMyth, string emotionalTag, string soundtrack);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCounterMyth(
        string memory mythID,
        string memory timestamp,
        string memory counterMyth,
        string memory emotionalTag,
        string memory soundtrack
    ) public onlySteward {
        manifest.push(Broadcast(mythID, timestamp, counterMyth, emotionalTag, soundtrack));
        emit CounterMythBroadcasted(mythID, timestamp, counterMyth, emotionalTag, soundtrack);
    }
}
