// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicTraumaNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string traumaType;
        string narrativeSource;
        string containmentAction;
        string truthReckoningSignal;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event CivicTraumaContained(string timestamp, string traumaType, string narrativeSource, string containmentAction, string truthReckoningSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containTrauma(
        string memory timestamp,
        string memory traumaType,
        string memory narrativeSource,
        string memory containmentAction,
        string memory truthReckoningSignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, traumaType, narrativeSource, containmentAction, truthReckoningSignal, emotionalTag));
        emit CivicTraumaContained(timestamp, traumaType, narrativeSource, containmentAction, truthReckoningSignal, emotionalTag);
    }
}
