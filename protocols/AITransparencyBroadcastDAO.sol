// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AITransparencyBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string topic;
        string agencyInvolved;
        string civicMessage;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event AITransparencyBroadcasted(string topic, string agencyInvolved, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTransparency(
        string memory topic,
        string memory agencyInvolved,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(topic, agencyInvolved, civicMessage, emotionalTag));
        emit AITransparencyBroadcasted(topic, agencyInvolved, civicMessage, emotionalTag);
    }
}
