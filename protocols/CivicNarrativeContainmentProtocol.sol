// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string sourceName;
        string timestamp;
        string narrativeType;
        string containmentMethod;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event NarrativeContained(string sourceName, string timestamp, string narrativeType, string containmentMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory sourceName,
        string memory timestamp,
        string memory narrativeType,
        string memory containmentMethod,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(sourceName, timestamp, narrativeType, containmentMethod, emotionalTag));
        emit NarrativeContained(sourceName, timestamp, narrativeType, containmentMethod, emotionalTag);
    }
}
