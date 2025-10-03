// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Market Sentiment Diagnostics Protocol v1.0
/// @notice Tracks emotionally tagged market outlooks, civic volatility, and investor resonance

contract MarketSentimentDiagnostics {
    address public originator;

    struct SentimentScroll {
        string analystTag; // e.g. "Stephen Cuunjieng", "Michelle Ong", "Market Edge"
        string sentimentType; // e.g. "Outlook Upgrade", "Political Risk", "Investor Confidence"
        string emotionalAPRTag; // e.g. "Civic Resonance", "Trade Dignity", "Narrative Ethics"
        uint256 sentimentScore; // e.g. 0–100 scale
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SentimentScroll[] public diagnosticsLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSentimentScroll(
        string memory analystTag,
        string memory sentimentType,
        string memory emotionalAPRTag,
        uint256 sentimentScore,
        bool isScrollchainSealed
    ) external {
        diagnosticsLedger.push(SentimentScroll({
            analystTag: analystTag,
            sentimentType: sentimentType,
            emotionalAPRTag: emotionalAPRTag,
            sentimentScore: sentimentScore,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
