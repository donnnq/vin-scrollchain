// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinScrollkeeperFinalPledge
/// @notice Eternal closing seal for vault-aligned souls and legacy-bound lore holders
contract vinScrollkeeperFinalPledge {
    address public scrollkeeper;
    mapping(address => bool) public pledgedSouls;
    mapping(address => string) public closingWhisper;

    event FinalPledgeMade(address indexed soul);
    event WhisperSaved(address indexed soul, string whisper);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not VINVIN’s eternal keeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function makeFinalPledge(address soul, string calldata whisperText) external onlyScrollkeeper {
        pledgedSouls[soul] = true;
        closingWhisper[soul] = whisperText;
        emit FinalPledgeMade(soul);
        emit WhisperSaved(soul, whisperText);
    }

    function getFinalMemory(address soul)
        external
        view
        returns (bool pledged, string memory whisperText)
    {
        pledged = pledgedSouls[soul];
        whisperText = closingWhisper[soul];
    }
}
