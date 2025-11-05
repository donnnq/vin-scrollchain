// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PWSASatelliteSignalIndex {
    address public steward;

    struct SignalEntry {
        string satelliteLayer;
        string signalType;
        string trackingDomain;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event SatelliteSignalIndexed(string satelliteLayer, string signalType, string trackingDomain, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexSignal(
        string memory satelliteLayer,
        string memory signalType,
        string memory trackingDomain,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(satelliteLayer, signalType, trackingDomain, emotionalTag));
        emit SatelliteSignalIndexed(satelliteLayer, signalType, trackingDomain, emotionalTag);
    }
}
