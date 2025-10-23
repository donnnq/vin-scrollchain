// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MentorFeedbackBroadcastGrid {
    address public steward;

    struct FeedbackEntry {
        string mentorName;
        string teenName;
        string feedbackSignal; // "Skill growth", "Confidence boost", "Livelihood readiness"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    FeedbackEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastFeedback(string memory mentorName, string memory teenName, string memory feedbackSignal, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(mentorName, teenName, feedbackSignal, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
