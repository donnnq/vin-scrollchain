// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFairFeedbackGrid {
    address public steward;

    struct FeedbackEntry {
        string barangayName;
        string participantType; // "Teen", "Parent", "Mentor", "Visitor"
        string feedbackSignal; // "Inspired", "Needs more tools", "Wants follow-up training"
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

    function submitFeedback(string memory barangayName, string memory participantType, string memory feedbackSignal, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(barangayName, participantType, feedbackSignal, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].received, "Must be received first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
