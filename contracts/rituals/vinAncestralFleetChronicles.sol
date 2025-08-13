// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinAncestralFleetChronicles {
    struct Chronicle {
        string fleetName;
        string mission;
        string emotionalTone;
        string mythicNote;
        uint256 timestamp;
        address chronicler;
    }

    Chronicle[] public chronicles;

    event ChronicleWritten(string fleetName, string mission, string emotionalTone, string mythicNote, address chronicler);

    function writeChronicle(
        string memory fleetName,
        string memory mission,
        string memory emotionalTone,
        string memory mythicNote
    ) public {
        chronicles.push(Chronicle(fleetName, mission, emotionalTone, mythicNote, block.timestamp, msg.sender));
        emit ChronicleWritten(fleetName, mission, emotionalTone, mythicNote, msg.sender);
    }

    function getChronicle(uint index) public view returns (
        string memory, string memory, string memory, string memory, uint256, address
    ) {
        Chronicle memory c = chronicles[index];
        return (c.fleetName, c.mission, c.emotionalTone, c.mythicNote, c.timestamp, c.chronicler);
    }

    function totalChronicles() public view returns (uint) {
        return chronicles.length;
    }
}
