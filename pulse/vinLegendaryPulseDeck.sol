// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinLegendaryPulseDeck {
    struct Pulse {
        string scrollName;
        string nation;
        string steward;
        uint256 empathyLevel;     // 0–100
        uint256 trustLevel;       // 0–100
        uint256 mythicClarity;    // 0–100
        string pulseNote;
        uint256 timestamp;
    }

    Pulse[] public pulses;

    event PulseLogged(string scrollName, string nation, uint256 empathyLevel, uint256 trustLevel, uint256 mythicClarity);

    function logPulse(
        string memory scrollName,
        string memory nation,
        string memory steward,
        uint256 empathyLevel,
        uint256 trustLevel,
        uint256 mythicClarity,
        string memory pulseNote
    ) public {
        pulses.push(Pulse(scrollName, nation, steward, empathyLevel, trustLevel, mythicClarity, pulseNote, block.timestamp));
        emit PulseLogged(scrollName, nation, empathyLevel, trustLevel, mythicClarity);
    }

    function getPulses() public view returns (Pulse[] memory) {
        return pulses;
    }
}
