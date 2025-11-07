// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateDisruptionContainmentManifest {
    address public steward;

    struct DisruptionEntry {
        string timestamp;
        string disruptionType;
        string legislativeTopic;
        string emotionalTag;
        string consequenceSummary;
    }

    DisruptionEntry[] public manifest;

    event SenateDisruptionContained(string timestamp, string disruptionType, string legislativeTopic, string emotionalTag, string consequenceSummary);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containDisruption(
        string memory timestamp,
        string memory disruptionType,
        string memory legislativeTopic,
        string memory emotionalTag,
        string memory consequenceSummary
    ) public onlySteward {
        manifest.push(DisruptionEntry(timestamp, disruptionType, legislativeTopic, emotionalTag, consequenceSummary));
        emit SenateDisruptionContained(timestamp, disruptionType, legislativeTopic, emotionalTag, consequenceSummary);
    }
}
