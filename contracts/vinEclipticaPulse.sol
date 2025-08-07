// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinEclipticaPulse {
    address public pulseConductor;
    uint256 public lastPulseTime;
    uint256 public pulseInterval;
    uint256 public totalPulses;

    event PulseEmitted(uint256 indexed pulseCount, uint256 timestamp, string ritualMood);

    modifier onlyConductor() {
        require(msg.sender == pulseConductor, "Not pulse conductor");
        _;
    }

    constructor(uint256 _initialInterval) {
        pulseConductor = msg.sender;
        pulseInterval = _initialInterval;
        lastPulseTime = block.timestamp;
    }

    function emitPulse(string calldata ritualMood) external onlyConductor {
        require(block.timestamp >= lastPulseTime + pulseInterval, "Interval not reached");
        totalPulses += 1;
        lastPulseTime = block.timestamp;
        emit PulseEmitted(totalPulses, block.timestamp, ritualMood);
    }

    function adjustInterval(uint256 newInterval) external onlyConductor {
        pulseInterval = newInterval;
    }

    function timeUntilNextPulse() external view returns (uint256) {
        if (block.timestamp >= lastPulseTime + pulseInterval) return 0;
        return (lastPulseTime + pulseInterval) - block.timestamp;
    }
}
