// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeepSeaNarrativeContainmentTreaty {
    address public steward;

    struct ContainmentEntry {
        string origin;
        string narrativeTheme;
        string timestamp;
        string counterLegend;
        string emotionalTag;
    }

    ContainmentEntry[] public log;

    event NarrativeContained(string origin, string narrativeTheme, string timestamp, string counterLegend, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory origin,
        string memory narrativeTheme,
        string memory timestamp,
        string memory counterLegend,
        string memory emotionalTag
    ) public onlySteward {
        log.push(ContainmentEntry(origin, narrativeTheme, timestamp, counterLegend, emotionalTag));
        emit NarrativeContained(origin, narrativeTheme, timestamp, counterLegend, emotionalTag);
    }
}
