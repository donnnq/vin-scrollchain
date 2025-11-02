// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulturalPerformanceBroadcastCodex {
    address public steward;

    struct PerformanceClause {
        string city;
        string performanceType;
        string broadcastChannel;
        string emotionalTag;
    }

    PerformanceClause[] public codex;

    event PerformanceBroadcasted(string city, string performanceType, string broadcastChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastPerformance(
        string memory city,
        string memory performanceType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PerformanceClause(city, performanceType, broadcastChannel, emotionalTag));
        emit PerformanceBroadcasted(city, performanceType, broadcastChannel, emotionalTag);
    }
}
