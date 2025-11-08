// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicEmotionAmplificationIndex {
    address public steward;

    struct AmplificationEntry {
        string timestamp;
        string contentTitle;
        string emotionType;
        uint256 intensityScore;
        string mobilizationEffect;
        string emotionalTag;
    }

    AmplificationEntry[] public index;

    event EmotionAmplified(string timestamp, string contentTitle, string emotionType, uint256 intensityScore, string mobilizationEffect, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function amplifyEmotion(
        string memory timestamp,
        string memory contentTitle,
        string memory emotionType,
        uint256 intensityScore,
        string memory mobilizationEffect,
        string memory emotionalTag
    ) public onlySteard {
        index.push(AmplificationEntry(timestamp, contentTitle, emotionType, intensityScore, mobilizationEffect, emotionalTag));
        emit EmotionAmplified(timestamp, contentTitle, emotionType, intensityScore, mobilizationEffect, emotionalTag);
    }
}
