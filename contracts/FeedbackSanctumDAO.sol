// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FeedbackSanctumDAO {
    address public originator;

    struct FeedbackSignal {
        string candidateName;
        bool interviewCompleted;
        bool feedbackDelivered;
        bool compassionAmplified;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FeedbackSignal[] public feedbackLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFeedbackSignal(
        string memory candidateName,
        bool interviewCompleted,
        bool feedbackDelivered,
        bool compassionAmplified,
        bool isScrollchainSealed
    ) external {
        feedbackLedger.push(FeedbackSignal({
            candidateName: candidateName,
            interviewCompleted: interviewCompleted,
            feedbackDelivered: feedbackDelivered,
            compassionAmplified: compassionAmplified,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
