// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinProofOfDeed
/// @notice Verifies that you don’t just talk — you deliver. Action must be logged to earn scrollkeeper respect.
contract vinProofOfDeed {
    address public immutable scrollkeeper;
    event DeedLogged(address indexed doer, string action, uint256 timestamp);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logDeed(string calldata action) external {
        emit DeedLogged(msg.sender, action, block.timestamp);
    }
}
