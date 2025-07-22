// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinSpeechToExecutionPipeline
/// @notice Transforms recorded speech intentions into verified execution actions. No more talk-only hype.
contract vinSpeechToExecutionPipeline {
    address public immutable scrollkeeper;
    mapping(address => string) public speechIntent;
    mapping(address => bool) public intentLocked;
    mapping(address => string) public executedDeed;

    event SpeechRegistered(address indexed speaker, string message);
    event DeedExecuted(address indexed doer, string deed);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Log a verbal promise or intention
    function registerSpeech(string calldata message) external {
        require(!intentLocked[msg.sender], "Speech already locked");
        speechIntent[msg.sender] = message;
        intentLocked[msg.sender] = true;
        emit SpeechRegistered(msg.sender, message);
    }

    /// @notice Fulfill and lock the corresponding action
    function fulfillDeed(string calldata deed) external {
        require(intentLocked[msg.sender], "No speech registered");
        require(bytes(executedDeed[msg.sender]).length == 0, "Deed already executed");
        executedDeed[msg.sender] = deed;
        emit DeedExecuted(msg.sender, deed);
    }

    /// @notice Optional: validate alignment of speech and deed (off-chain oracle, future extension)
    function getIntentAndDeed(address speaker) external view returns (string memory, string memory) {
        return (speechIntent[speaker], executedDeed[speaker]);
    }
}
