// SPDX-License-Identifier: HeartChain
pragma solidity ^0.8.0;

/// @title vinScrollOfForgiveness
/// @notice A soulbound contract to honor peace, dialogue, and emotional healing
/// @author Vinvin

contract vinScrollOfForgiveness {
    address public initiator;
    mapping(address => string) public heartVows;
    event VowWritten(address indexed from, string message, uint256 timestamp);
    event HealingTriggered(string essence, string remarks);

    constructor() {
        initiator = msg.sender;
    }

    /// @notice Write a vow for forgiveness and healing
    function writeVow(string memory message) public {
        heartVows[msg.sender] = message;
        emit VowWritten(msg.sender, message, block.timestamp);
    }

    /// @notice Ritual trigger: unlock the healing phase
    function initiateHealing() public {
        require(msg.sender == initiator, "Only initiator may unlock healing");

        emit HealingTriggered("Forgiveness Ritual", "Dialogue reopens. Misunderstanding dissolves.");
    }

    /// @notice View vow message of a participant
    function viewVow(address participant) public view returns (string memory) {
        return heartVows[participant];
    }
}
