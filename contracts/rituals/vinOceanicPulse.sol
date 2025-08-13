// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinOceanicPulse {
    struct Pulse {
        string region;
        int256 emotionalIndex; // -100 (unrest) to +100 (harmony)
        string civicSignal;
        uint256 timestamp;
    }

    Pulse[] public pulses;

    event PulseLogged(string region, int256 emotionalIndex, string civicSignal, uint256 timestamp);

    function logPulse(string memory region, int256 emotionalIndex, string memory civicSignal) public {
        require(emotionalIndex >= -100 && emotionalIndex <= 100, "Index out of bounds.");
        pulses.push(Pulse(region, emotionalIndex, civicSignal, block.timestamp));
        emit PulseLogged(region, emotionalIndex, civicSignal, block.timestamp);
    }

    function getRecentPulse(uint index) public view returns (
        string memory, int256, string memory, uint256
    ) {
        Pulse memory p = pulses[index];
        return (p.region, p.emotionalIndex, p.civicSignal, p.timestamp);
    }

    function totalPulses() public view returns (uint) {
        return pulses.length;
    }
}
