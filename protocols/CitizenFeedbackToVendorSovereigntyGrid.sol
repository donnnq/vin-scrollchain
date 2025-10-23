// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenFeedbackToVendorSovereigntyGrid {
    address public steward;

    struct FeedbackEntry {
        string username;
        string commentContent;
        string feedbackSignal; // "Overflow concern", "Cleanliness request", "Safety recommendation"
        string emotionalTag;
        bool activated;
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

    function activateFeedback(string memory username, string memory commentContent, string memory feedbackSignal, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(username, commentContent, feedbackSignal, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
