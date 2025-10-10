// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TraderSentimentDAO {
    address public originator;

    struct SentimentSignal {
        string asset;
        string sentimentLevel;
        string resilienceMetric;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SentimentSignal[] public sentimentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSentimentSignal(
        string memory asset,
        string memory sentimentLevel,
        string memory resilienceMetric,
        bool isScrollchainSealed
    ) external {
        sentimentLedger.push(SentimentSignal({
            asset: asset,
            sentimentLevel: sentimentLevel,
            resilienceMetric: resilienceMetric,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
