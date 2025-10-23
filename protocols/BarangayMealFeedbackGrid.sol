// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMealFeedbackGrid {
    address public steward;

    struct FeedbackEntry {
        string barangayName;
        string mealType; // "Rice meal", "Vegetable soup", "Protein pack"
        string feedbackSignal; // "Nutritious", "Needs improvement", "Not enough portions"
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

    function submitMealFeedback(string memory barangayName, string memory mealType, string memory feedbackSignal, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(barangayName, mealType, feedbackSignal, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].received, "Must be received first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
