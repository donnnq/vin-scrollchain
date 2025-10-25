// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerToFeedbackProtocol {
    address public steward;

    struct FeedbackEntry {
        string workerName; // "Vinvin"
        string issueObserved; // "Gulong lumalaban", "Transport bin friction"
        string feedbackMethod; // "Scrollchain log", "Supervisor report", "Maintenance tag"
        string emotionalTag;
        bool logged;
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

    function logFeedback(string memory workerName, string memory issueObserved, string memory feedbackMethod, string memory emotionalTag) external onlySteward {
        entries.push(FeedbackEntry(workerName, issueObserved, feedbackMethod, emotionalTag, true, false));
    }

    function sealFeedbackEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getFeedbackEntry(uint256 index) external view returns (FeedbackEntry memory) {
        return entries[index];
    }
}
