// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinResilience {
    event Fall(string reason, uint256 blockNumber);
    event Rise(uint256 blockNumber);
    event Step(address walker, uint256 stepCount);

    uint256 public steps;

    function fall(string memory reason) external {
        emit Fall(reason, block.number);
    }

    function rise() external {
        emit Rise(block.number);
    }

    function walk() external {
        steps++;
        emit Step(msg.sender, steps);
    }
}