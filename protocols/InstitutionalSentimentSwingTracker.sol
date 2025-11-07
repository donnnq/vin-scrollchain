// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalSentimentSwingTracker {
    address public steward;

    struct SentimentSwing {
        string institution;
        string assetClass;
        string previousSentiment;
        string newSentiment;
        string timestamp;
        string triggerEvent;
    }

    SentimentSwing[] public swings;

    event SentimentSwingLogged(string institution, string assetClass, string previousSentiment, string newSentiment, string timestamp, string triggerEvent);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSwing(
        string memory institution,
        string memory assetClass,
        string memory previousSentiment,
        string memory newSentiment,
        string memory timestamp,
        string memory triggerEvent
    ) public onlySteward {
        swings.push(SentimentSwing(institution, assetClass, previousSentiment, newSentiment, timestamp, triggerEvent));
        emit SentimentSwingLogged(institution, assetClass, previousSentiment, newSentiment, timestamp, triggerEvent);
    }
}
