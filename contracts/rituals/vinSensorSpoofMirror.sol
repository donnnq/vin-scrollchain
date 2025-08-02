// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSensorSpoofMirror {
    event SensorSpoofed(string sensorType, uint256 timestamp);

    function spoofSensorFeed(string memory sensorType) public {
        emit SensorSpoofed(sensorType, block.timestamp);
    }
}
