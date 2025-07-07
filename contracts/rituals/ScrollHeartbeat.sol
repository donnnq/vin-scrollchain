// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollHeartbeat {
    event Heartbeat(address indexed sender, uint256 timestamp, string message);

    uint256 public lastBeat;

    function beat(string calldata message) external {
        require(block.timestamp >= lastBeat + 1 days, "Too soon");
        lastBeat = block.timestamp;
        emit Heartbeat(msg.sender, block.timestamp, message);
    }
}
