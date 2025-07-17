// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinScrollForgiveness {
    mapping(address => bool) public forgiven;

    event ForgivenessInvoked(address indexed soul, string reason, uint256 timestamp);

    function pardon(address soul, string memory reason) external {
        require(!forgiven[soul], "Already forgiven");
        forgiven[soul] = true;
        emit ForgivenessInvoked(soul, reason, block.timestamp);
    }

    function isForgiven(address soul) external view returns (bool) {
        return forgiven[soul];
    }
}
