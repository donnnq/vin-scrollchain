// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHiringFeedbackDAO {
    address public steward;

    struct FeedbackEntry {
        string seekerName;
        string recruiterName;
        string feedbackNote;
        string emotionalTag;
    }

    FeedbackEntry[] public registry;

    event HiringFeedbackTagged(string seekerName, string recruiterName, string feedbackNote, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHiringFeedback(
        string memory seekerName,
        string memory recruiterName,
        string memory feedbackNote,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FeedbackEntry(seekerName, recruiterName, feedbackNote, emotionalTag));
        emit HiringFeedbackTagged(seekerName, recruiterName, feedbackNote, emotionalTag);
    }
}
