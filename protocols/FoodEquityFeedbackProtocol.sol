// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodEquityFeedbackProtocol {
    address public steward;

    struct FeedbackEntry {
        string respondentType; // "Parent", "Vendor", "Teen", "Health worker"
        string feedbackSignal; // "Food access improved", "Still expensive", "Needs more outlets"
        string emotionalTag;
        bool received;
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

    function submitFeedback(string memory respondentType, string memory feedbackSignal, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(respondentType, feedbackSignal, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].received, "Must be received first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
