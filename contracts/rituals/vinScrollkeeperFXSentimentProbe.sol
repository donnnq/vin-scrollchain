// SPDX-License-Identifier: VIN-SentimentTracker
pragma solidity ^0.8.19;

contract vinScrollkeeperFXSentimentProbe {
    address public vinvinSoul;
    mapping(string => int256) public trustScores;

    event ScoreUpdated(string currency, int256 score);

    constructor() {
        vinvinSoul = msg.sender;
    }

    function updateTrust(string memory currency, int256 score) external {
        trustScores[currency] = score;
        emit ScoreUpdated(currency, score);
    }

    function getScore(string memory currency) external view returns (int256) {
        return trustScores[currency];
    }
}
