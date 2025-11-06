// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityCareBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string communityName;
        string careType;
        string civicMessage;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event CommunityCareBroadcasted(string communityName, string careType, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCare(
        string memory communityName,
        string memory careType,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(communityName, careType, civicMessage, emotionalTag));
        emit CommunityCareBroadcasted(communityName, careType, civicMessage, emotionalTag);
    }
}
