// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StormSurgeNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string region;
        string timestamp;
        string dominantNarrative;
        string counterMessage;
        string emotionalTag;
    }

    ContainmentEntry[] public log;

    event NarrativeContained(string region, string timestamp, string dominantNarrative, string counterMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory region,
        string memory timestamp,
        string memory dominantNarrative,
        string memory counterMessage,
        string memory emotionalTag
    ) public onlySteward {
        log.push(ContainmentEntry(region, timestamp, dominantNarrative, counterMessage, emotionalTag));
        emit NarrativeContained(region, timestamp, dominantNarrative, counterMessage, emotionalTag);
    }
}
