// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CreativeSovereigntySignalDAO {
    address public originator;

    struct FeatureSignal {
        string featureName;
        string userSentiment;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FeatureSignal[] public feedbackLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFeatureSignal(
        string memory featureName,
        string memory userSentiment,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        feedbackLedger.push(FeatureSignal({
            featureName: featureName,
            userSentiment: userSentiment,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
