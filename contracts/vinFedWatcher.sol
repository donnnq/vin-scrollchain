// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinFedWatcher
/// @notice VINVIN's macro oracle that tracks Federal Reserve sentiments and volatility
/// @dev Emits FOMC indicators, sentiment pulses, and rumor alerts

contract vinFedWatcher {
    event PowellSignal(uint256 timestamp, string message);
    event RumorAlert(string sourceHandle, uint256 views, bool verified);
    event RateSentimentPulse(int256 biasIndex, string mood);
    event KiligMacroRitualEngaged(address indexed observer, uint256 timestamp);

    string public currentSentiment = "Neutral Hawk";
    uint256 public lastSpeechTimestamp;
    mapping(string => bool) public rumorSources;

    function engageMacroRitual() public {
        lastSpeechTimestamp = block.timestamp;
        emit KiligMacroRitualEngaged(msg.sender, block.timestamp);
    }

    function signalPowellSpeech(string memory message) public {
        lastSpeechTimestamp = block.timestamp;
        emit PowellSignal(block.timestamp, message);
    }

    function logRumor(string memory sourceHandle, uint256 views, bool verified) public {
        rumorSources[sourceHandle] = verified;
        emit RumorAlert(sourceHandle, views, verified);
    }

    function pulseSentiment(int256 biasIndex) public {
        string memory mood = biasIndex > 0 ? "Dovish Tilt" : (biasIndex < 0 ? "Hawkish Pressure" : "Neutral Chill");
        currentSentiment = mood;
        emit RateSentimentPulse(biasIndex, mood);
    }

    function getFedMood() public view returns (string memory) {
        return currentSentiment;
    }
}
