// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string narrativeSource;
        string framingType;
        string containmentAction;
        string civicImpactSignal;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event ShutdownNarrativeContained(string timestamp, string narrativeSource, string framingType, string containmentAction, string civicImpactSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory timestamp,
        string memory narrativeSource,
        string memory framingType,
        string memory containmentAction,
        string memory civicImpactSignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, narrativeSource, framingType, containmentAction, civicImpactSignal, emotionalTag));
        emit ShutdownNarrativeContained(timestamp, narrativeSource, framingType, containmentAction, civicImpactSignal, emotionalTag);
    }
}
