// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBroadcastAvailabilityAuditDAO {
    address public steward;

    struct BroadcastEntry {
        string channelName;
        string timestamp;
        string videoTitle;
        string availabilityStatus;
        string civicImpact;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event BroadcastFlagged(string channelName, string timestamp, string videoTitle, string availabilityStatus, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagBroadcast(
        string memory channelName,
        string memory timestamp,
        string memory videoTitle,
        string memory availabilityStatus,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(channelName, timestamp, videoTitle, availabilityStatus, civicImpact, emotionalTag));
        emit BroadcastFlagged(channelName, timestamp, videoTitle, availabilityStatus, civicImpact, emotionalTag);
    }
}
