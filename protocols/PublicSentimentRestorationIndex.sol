// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSentimentRestorationIndex {
    address public steward;

    struct RestorationEntry {
        string timestamp;
        string initiative;
        uint256 trustScore;
        string civicHealingSignal;
        string emotionalTag;
    }

    RestorationEntry[] public index;

    event SentimentRestored(string timestamp, string initiative, uint256 trustScore, string civicHealingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function restoreSentiment(
        string memory timestamp,
        string memory initiative,
        uint256 trustScore,
        string memory civicHealingSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RestorationEntry(timestamp, initiative, trustScore, civicHealingSignal, emotionalTag));
        emit SentimentRestored(timestamp, initiative, trustScore, civicHealingSignal, emotionalTag);
    }
}
