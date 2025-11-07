// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateInfrastructurePublicFeedbackLedger {
    address public steward;

    struct FeedbackEntry {
        string barangay;
        string timestamp;
        string projectName;
        string feedbackContent;
        string emotionalTag;
    }

    FeedbackEntry[] public ledger;

    event FeedbackLogged(string barangay, string timestamp, string projectName, string feedbackContent, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFeedback(
        string memory barangay,
        string memory timestamp,
        string memory projectName,
        string memory feedbackContent,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FeedbackEntry(barangay, timestamp, projectName, feedbackContent, emotionalTag));
        emit FeedbackLogged(barangay, timestamp, projectName, feedbackContent, emotionalTag);
    }
}
