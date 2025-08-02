// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinScrollPulseBot {
    event PulseUpdate(address indexed sender, string status, uint256 timestamp);

    function sendPulse(string memory status) public {
        emit PulseUpdate(msg.sender, status, block.timestamp);
    }
}
