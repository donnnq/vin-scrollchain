// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicResistanceBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string communityName;
        string resistanceType;
        string civicMessage;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event CivicResistanceBroadcasted(string communityName, string resistanceType, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResistance(
        string memory communityName,
        string memory resistanceType,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(communityName, resistanceType, civicMessage, emotionalTag));
        emit CivicResistanceBroadcasted(communityName, resistanceType, civicMessage, emotionalTag);
    }
}
