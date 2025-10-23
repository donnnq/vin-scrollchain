// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityFeedbackToUrbanSovereigntyIndex {
    address public steward;

    struct FeedbackEntry {
        string username;
        string commentContent;
        string feedbackType; // "Praise", "Concern", "Suggestion"
        string emotionalTag;
        bool indexed;
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

    function indexFeedback(string memory username, string memory commentContent, string memory feedbackType, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(username, commentContent, feedbackType, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
