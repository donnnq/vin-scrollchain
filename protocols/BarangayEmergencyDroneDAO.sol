// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEmergencyDroneDAO {
    address public steward;

    struct EmergencyDroneEntry {
        string barangay;
        string droneType;
        string emergencyUse;
        string emotionalTag;
    }

    EmergencyDroneEntry[] public registry;

    event EmergencyDroneTagged(string barangay, string droneType, string emergencyUse, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEmergencyDrone(
        string memory barangay,
        string memory droneType,
        string memory emergencyUse,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EmergencyDroneEntry(barangay, droneType, emergencyUse, emotionalTag));
        emit EmergencyDroneTagged(barangay, droneType, emergencyUse, emotionalTag);
    }
}
