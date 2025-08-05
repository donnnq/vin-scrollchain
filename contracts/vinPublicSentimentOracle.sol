// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinPublicSentimentOracle
/// @notice Logs public sentiment strings and exposes the latest entry
contract vinPublicSentimentOracle {
    /// @notice Automatically creates latestSentiment() getter
    string public latestSentiment;

    event SentimentLogged(string sentiment);

    /// @notice Logs a new sentiment and updates the latest state
    /// @param sentiment The sentiment string to record
    function logSentiment(string calldata sentiment) external {
        latestSentiment = sentiment;
        emit SentimentLogged(sentiment);
    }
}
