// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketSentimentReversalDAO {
    address public steward;

    struct ReversalSignal {
        string assetClass;
        string previousSentiment;
        string newSentiment;
        string timestamp;
        string triggerEvent;
    }

    ReversalSignal[] public signals;

    event SentimentReversalLogged(string assetClass, string previousSentiment, string newSentiment, string timestamp, string triggerEvent);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logReversal(
        string memory assetClass,
        string memory previousSentiment,
        string memory newSentiment,
        string memory timestamp,
        string memory triggerEvent
    ) public onlySteward {
        signals.push(ReversalSignal(assetClass, previousSentiment, newSentiment, timestamp, triggerEvent));
        emit SentimentReversalLogged(assetClass, previousSentiment, newSentiment, timestamp, triggerEvent);
    }
}
