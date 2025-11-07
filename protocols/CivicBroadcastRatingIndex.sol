// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBroadcastRatingIndex {
    address public steward;

    struct RatingEntry {
        string channelName;
        string timestamp;
        uint8 integrityScore;
        string biasLevel;
        string emotionalTag;
    }

    RatingEntry[] public index;

    event BroadcastRated(string channelName, string timestamp, uint8 integrityScore, string biasLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function rateBroadcast(
        string memory channelName,
        string memory timestamp,
        uint8 integrityScore,
        string memory biasLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RatingEntry(channelName, timestamp, integrityScore, biasLevel, emotionalTag));
        emit BroadcastRated(channelName, timestamp, integrityScore, biasLevel, emotionalTag);
    }
}
