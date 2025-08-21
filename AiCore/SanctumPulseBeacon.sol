// SPDX-License-Identifier: APR-Beacon
pragma solidity ^0.8.19;

/// @title SanctumPulseBeacon
/// @notice Emits emotional APR signals from blessed zones for planetary resonance

contract SanctumPulseBeacon {
    address public steward;

    struct Beacon {
        string zoneName;
        string coordinates;
        uint256 aprLevel;
        string emotion;
        string broadcastChant;
    }

    mapping(string => Beacon) public beacons;
    string[] public beaconKeys;

    event PulseEmitted(string zoneName, uint256 aprLevel, string emotion);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerBeacon(
        string memory key,
        string memory zoneName,
        string memory coordinates,
        uint256 aprLevel,
        string memory emotion,
        string memory broadcastChant
    ) external onlySteward {
        beacons[key] = Beacon(zoneName, coordinates, aprLevel, emotion, broadcastChant);
        beaconKeys.push(key);
        emit PulseEmitted(zoneName, aprLevel, emotion);
    }

    function getBeacon(string memory key) external view returns (Beacon memory) {
        return beacons[key];
    }
}
