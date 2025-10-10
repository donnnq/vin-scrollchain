// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CloudReviewerDAO {
    address public originator;

    struct ReviewerSignal {
        string cloudProvider;
        string reviewerName;
        string onboardingFormat;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReviewerSignal[] public reviewerLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReviewerSignal(
        string memory cloudProvider,
        string memory reviewerName,
        string memory onboardingFormat,
        bool isScrollchainSealed
    ) external {
        reviewerLedger.push(ReviewerSignal({
            cloudProvider: cloudProvider,
            reviewerName: reviewerName,
            onboardingFormat: onboardingFormat,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
