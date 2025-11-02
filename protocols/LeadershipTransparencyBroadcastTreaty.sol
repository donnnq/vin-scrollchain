// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipTransparencyBroadcastTreaty {
    address public steward;

    struct BroadcastEntry {
        string officialName;
        string corridor;
        string broadcastType;
        string emotionalTag;
    }

    BroadcastEntry[] public treatyLog;

    event BroadcastTagged(string officialName, string corridor, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagBroadcast(
        string memory officialName,
        string memory corridor,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(BroadcastEntry(officialName, corridor, broadcastType, emotionalTag));
        emit BroadcastTagged(officialName, corridor, broadcastType, emotionalTag);
    }
}
