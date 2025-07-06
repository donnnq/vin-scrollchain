// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinWatchtower {
    event SuspiciousActivity(address indexed from, string action);
    event ChainPing(address indexed observer, uint256 blockNumber);

    function ping() external {
        emit ChainPing(msg.sender, block.number);
    }

    function report(address suspect, string calldata action) external {
        emit SuspiciousActivity(suspect, action);
    }
}
