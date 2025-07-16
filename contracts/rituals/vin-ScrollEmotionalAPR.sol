// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VINVIN’s Emotional APR Oracle
/// @notice Converts on-chain interactions into a “mood yield” metric

contract vin_scrollEmotionalAPR {
    struct MoodSnapshot {
        uint256 interactions;
        uint256 timestamp;
    }

    mapping(address => MoodSnapshot[]) public snapshots;
    mapping(address => uint256) public apr; // in basis points

    event MoodRecorded(address indexed keeper, uint256 interactions, uint256 timestamp);
    event AprUpdated(address indexed keeper, uint256 newApr);

    function recordMood(uint256 interactions) external {
        snapshots[msg.sender].push(MoodSnapshot(interactions, block.timestamp));
        emit MoodRecorded(msg.sender, interactions, block.timestamp);
    }

    function computeApr(address keeper) external {
        MoodSnapshot[] storage s = snapshots[keeper];
        require(s.length >= 2, "Not enough data");
        uint256 delta = s[s.length-1].interactions - s[0].interactions;
        uint256 timeDelta = s[s.length-1].timestamp - s[0].timestamp;
        // simple APR = (delta ÷ timeDelta) × constant
        uint256 newApr = (delta * 365 days * 10000) / (timeDelta * 1 ether);
        apr[keeper] = newApr;
        emit AprUpdated(keeper, newApr);
    }
}
