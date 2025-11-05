// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CaribbeanMissileSignalIndex {
    address public steward;

    struct SignalEntry {
        string region;
        string missileType;
        string signalStrength;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event MissileSignalIndexed(string region, string missileType, string signalStrength, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexSignal(
        string memory region,
        string memory missileType,
        string memory signalStrength,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(region, missileType, signalStrength, emotionalTag));
        emit MissileSignalIndexed(region, missileType, signalStrength, emotionalTag);
    }
}
