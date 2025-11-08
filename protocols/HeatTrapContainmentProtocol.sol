// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeatTrapContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string location;
        string surfaceType;
        string containmentMethod;
        string temperatureReductionSignal;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event HeatTrapContained(string timestamp, string location, string surfaceType, string containmentMethod, string temperatureReductionSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containHeatTrap(
        string memory timestamp,
        string memory location,
        string memory surfaceType,
        string memory containmentMethod,
        string memory temperatureReductionSignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, location, surfaceType, containmentMethod, temperatureReductionSignal, emotionalTag));
        emit HeatTrapContained(timestamp, location, surfaceType, containmentMethod, temperatureReductionSignal, emotionalTag);
    }
}
