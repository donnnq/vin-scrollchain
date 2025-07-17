// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinScrollEchoMirror {
    event EchoCast(address caster, string message, uint256 timestamp);

    function castEcho(string memory message) external {
        emit EchoCast(msg.sender, message, block.timestamp);
    }
}
