// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayDeliveryRiderDAO {
    address public steward;

    struct RiderEntry {
        string barangay;
        string platform;
        string vehicleType;
        string emotionalTag;
    }

    RiderEntry[] public registry;

    event RiderTagged(string barangay, string platform, string vehicleType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRider(
        string memory barangay,
        string memory platform,
        string memory vehicleType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RiderEntry(barangay, platform, vehicleType, emotionalTag));
        emit RiderTagged(barangay, platform, vehicleType, emotionalTag);
    }
}
