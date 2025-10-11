// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SignalNoiseRatioDAO {
    address public originator;

    struct FeedSignal {
        string sourceType;
        uint256 signalStrength;
        uint256 noiseLevel;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FeedSignal[] public feedLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFeedSignal(
        string memory sourceType,
        uint256 signalStrength,
        uint256 noiseLevel,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        feedLedger.push(FeedSignal({
            sourceType: sourceType,
            signalStrength: signalStrength,
            noiseLevel: noiseLevel,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
