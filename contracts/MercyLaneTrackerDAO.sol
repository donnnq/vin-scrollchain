// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MercyLaneTrackerDAO
 * @dev Emotionally tagged smart contract to track every individual who enters the mercy lane
 * for fee-free reentry, dignity restoration, and scrollchain verification.
 */

contract MercyLaneTrackerDAO {
    address public steward;

    struct Entry {
        address identity;
        uint256 timestamp;
        string emotionalTag;
    }

    Entry[] public entries;

    event MercyLaneEntered(address indexed identity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may track mercy lane entries");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEntry(address identity, string memory emotionalTag) external onlySteward {
        entries.push(Entry({
            identity: identity,
            timestamp: block.timestamp,
            emotionalTag: emotionalTag
        }));

        emit MercyLaneEntered(identity, emotionalTag, block.timestamp);
    }

    function getEntryCount() external view returns (uint256) {
        return entries.length;
    }

    function getEntryByIndex(uint256 index) external view returns (address identity, uint256 timestamp, string memory emotionalTag) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        Entry memory e = entries[index];
        return (e.identity, e.timestamp, e.emotionalTag);
    }
}
