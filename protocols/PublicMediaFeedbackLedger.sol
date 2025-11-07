// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicMediaFeedbackLedger {
    address public steward;

    struct FeedbackEntry {
        string channelName;
        string timestamp;
        string feedbackContent;
        uint8 rating; // 1 to 5
        string emotionalTag;
    }

    FeedbackEntry[] public ledger;

    event MediaFeedbackLogged(string channelName, string timestamp, string feedbackContent, uint8 rating, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFeedback(
        string memory channelName,
        string memory timestamp,
        string memory feedbackContent,
        uint8 rating,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FeedbackEntry(channelName, timestamp, feedbackContent, rating, emotionalTag));
        emit MediaFeedbackLogged(channelName, timestamp, feedbackContent, rating, emotionalTag);
    }
}
