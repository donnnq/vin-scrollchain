// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeDisinformationContainmentProtocol {
    address public steward;

    struct DisinfoEntry {
        string timestamp;
        string source;
        string legislativeTopic;
        string disinfoType;
        string containmentAction;
        string emotionalTag;
    }

    DisinfoEntry[] public protocol;

    event DisinformationContained(string timestamp, string source, string legislativeTopic, string disinfoType, string containmentAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containDisinfo(
        string memory timestamp,
        string memory source,
        string memory legislativeTopic,
        string memory disinfoType,
        string memory containmentAction,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(DisinfoEntry(timestamp, source, legislativeTopic, disinfoType, containmentAction, emotionalTag));
        emit DisinformationContained(timestamp, source, legislativeTopic, disinfoType, containmentAction, emotionalTag);
    }
}
