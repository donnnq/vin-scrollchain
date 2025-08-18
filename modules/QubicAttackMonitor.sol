// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title QubicAttackMonitor
/// @notice Logs hashrate shifts, voting outcomes, and civic alerts related to Qubic's blockchain targeting.

contract QubicAttackMonitor {
    struct TargetEvent {
        string chain;
        uint256 timestamp;
        uint256 votesReceived;
        bool isTargeted;
    }

    TargetEvent[] public events;

    function logEvent(string memory chain, uint256 votes, bool isTargeted) public {
        events.push(TargetEvent({
            chain: chain,
            timestamp: block.timestamp,
            votesReceived: votes,
            isTargeted: isTargeted
        }));
    }

    function getEvent(uint index) public view returns (TargetEvent memory) {
        return events[index];
    }
}
