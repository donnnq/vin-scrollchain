// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdaptiveGreeningContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string location;
        string greeningMethod;
        string plantType;
        string soilAccessStatus;
        string soilSovereigntySignal;
        string urbanResilienceTag;
    }

    ContainmentEntry[] public protocol;

    event AdaptiveGreeningContained(string timestamp, string location, string greeningMethod, string plantType, string soilAccessStatus, string soilSovereigntySignal, string urbanResilienceTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containGreening(
        string memory timestamp,
        string memory location,
        string memory greeningMethod,
        string memory plantType,
        string memory soilAccessStatus,
        string memory soilSovereigntySignal,
        string memory urbanResilienceTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, location, greeningMethod, plantType, soilAccessStatus, soilSovereigntySignal, urbanResilienceTag));
        emit AdaptiveGreeningContained(timestamp, location, greeningMethod, plantType, soilAccessStatus, soilSovereigntySignal, urbanResilienceTag);
    }
}
