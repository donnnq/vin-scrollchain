// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownCivicImpactIndex {
    address public steward;

    struct ImpactEntry {
        string timestamp;
        string shutdownPhase;
        uint256 trustScore;
        uint256 institutionalStabilityScore;
        string publicSentimentSignal;
        string emotionalTag;
    }

    ImpactEntry[] public index;

    event ShutdownImpactIndexed(string timestamp, string shutdownPhase, uint256 trustScore, uint256 institutionalStabilityScore, string publicSentimentSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexImpact(
        string memory timestamp,
        string memory shutdownPhase,
        uint256 trustScore,
        uint256 institutionalStabilityScore,
        string memory publicSentimentSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImpactEntry(timestamp, shutdownPhase, trustScore, institutionalStabilityScore, publicSentimentSignal, emotionalTag));
        emit ShutdownImpactIndexed(timestamp, shutdownPhase, trustScore, institutionalStabilityScore, publicSentimentSignal, emotionalTag);
    }
}
