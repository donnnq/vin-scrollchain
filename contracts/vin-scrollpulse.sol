// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollPulse {
    uint256 public lastPulse;
    address public immutable pulsekeeper;

    event PulseEmitted(address indexed by, uint256 timestamp);
    event PulseMissed(address indexed checker, uint256 lastPulse, uint256 currentTime);

    modifier onlyPulsekeeper() {
        require(msg.sender == pulsekeeper, "Not the pulsekeeper");
        _;
    }

    constructor() {
        pulsekeeper = msg.sender;
        lastPulse = block.timestamp;
    }

    function emitPulse() external onlyPulsekeeper {
        lastPulse = block.timestamp;
        emit PulseEmitted(msg.sender, lastPulse);
    }

    function checkPulse(uint256 maxInterval) external view returns (bool alive) {
        return (block.timestamp - lastPulse) <= maxInterval;
    }

    function verifyPulse(uint256 maxInterval) external {
        if ((block.timestamp - lastPulse) > maxInterval) {
            emit PulseMissed(msg.sender, lastPulse, block.timestamp);
        }
    }
}
