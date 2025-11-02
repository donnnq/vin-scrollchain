// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayDroneLogisticsDAO {
    address public steward;

    struct DroneEntry {
        string barangay;
        string droneType;
        string logisticsPartner;
        string emotionalTag;
    }

    DroneEntry[] public registry;

    event DroneLogisticsTagged(string barangay, string droneType, string logisticsPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDroneLogistics(
        string memory barangay,
        string memory droneType,
        string memory logisticsPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DroneEntry(barangay, droneType, logisticsPartner, emotionalTag));
        emit DroneLogisticsTagged(barangay, droneType, logisticsPartner, emotionalTag);
    }
}
