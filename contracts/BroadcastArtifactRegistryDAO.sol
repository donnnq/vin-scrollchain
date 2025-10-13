// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BroadcastArtifactRegistryDAO {
    address public steward;

    struct BroadcastEvent {
        string showTitle; // "60 Minutes"
        string milestone; // "58 Seasons", "Top 10 Nielsen", "Crash Warning Episode"
        string civicImpact; // "Public Awareness", "Market Sentiment Shift", "Historical Parallel"
        string emotionalTag;
        uint256 timestamp;
    }

    BroadcastEvent[] public events;

    event BroadcastLogged(
        string showTitle,
        string milestone,
        string civicImpact,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log broadcast artifact rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBroadcast(
        string memory showTitle,
        string memory milestone,
        string memory civicImpact,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BroadcastEvent({
            showTitle: showTitle,
            milestone: milestone,
            civicImpact: civicImpact,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BroadcastLogged(showTitle, milestone, civicImpact, emotionalTag, block.timestamp);
    }

    function getBroadcastByIndex(uint256 index) external view returns (
        string memory showTitle,
        string memory milestone,
        string memory civicImpact,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BroadcastEvent memory b = events[index];
        return (
            b.showTitle,
            b.milestone,
            b.civicImpact,
            b.emotionalTag,
            b.timestamp
        );
    }
}
