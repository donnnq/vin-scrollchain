// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComfortSovereigntyFeedbackCodex {
    address public admin;

    struct FeedbackEntry {
        string region;
        string desiredRoute;
        string feedbackSummary;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    FeedbackEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFeedback(string memory region, string memory desiredRoute, string memory feedbackSummary, string memory emotionalTag) external onlyAdmin {
        entries.push(FeedbackEntry(region, desiredRoute, feedbackSummary, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealFeedbackEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
