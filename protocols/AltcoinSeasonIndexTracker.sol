// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinSeasonIndexTracker {
    address public steward;

    struct IndexEntry {
        uint256 indexValue;
        string timestamp;
        string marketMood;
        string emotionalTag;
    }

    IndexEntry[] public tracker;

    event AltcoinSeasonLogged(uint256 indexValue, string timestamp, string marketMood, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logIndex(
        uint256 indexValue,
        string memory timestamp,
        string memory marketMood,
        string memory emotionalTag
    ) public onlySteward {
        tracker.push(IndexEntry(indexValue, timestamp, marketMood, emotionalTag));
        emit AltcoinSeasonLogged(indexValue, timestamp, marketMood, emotionalTag);
    }
}
