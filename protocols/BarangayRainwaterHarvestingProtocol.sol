// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRainwaterHarvestingProtocol {
    address public steward;

    struct HarvestEntry {
        string barangay;
        string timestamp;
        uint256 volumeLiters;
        string systemStatus;
        string emotionalTag;
    }

    HarvestEntry[] public protocol;

    event RainwaterHarvested(string barangay, string timestamp, uint256 volumeLiters, string systemStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logHarvest(
        string memory barangay,
        string memory timestamp,
        uint256 volumeLiters,
        string memory systemStatus,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(HarvestEntry(barangay, timestamp, volumeLiters, systemStatus, emotionalTag));
        emit RainwaterHarvested(barangay, timestamp, volumeLiters, systemStatus, emotionalTag);
    }
}
