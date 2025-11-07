// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativePivotDetectionProtocol {
    address public steward;

    struct PivotEntry {
        string narrativeTheme;
        string source;
        string pivotType; // e.g., "Bullish to Bearish"
        string timestamp;
        string triggerEvent;
    }

    PivotEntry[] public pivots;

    event NarrativePivotDetected(string narrativeTheme, string source, string pivotType, string timestamp, string triggerEvent);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function detectPivot(
        string memory narrativeTheme,
        string memory source,
        string memory pivotType,
        string memory timestamp,
        string memory triggerEvent
    ) public onlySteward {
        pivots.push(PivotEntry(narrativeTheme, source, pivotType, timestamp, triggerEvent));
        emit NarrativePivotDetected(narrativeTheme, source, pivotType, timestamp, triggerEvent);
    }
}
