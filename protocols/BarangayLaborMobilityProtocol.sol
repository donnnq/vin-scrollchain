// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLaborMobilityProtocol {
    address public steward;

    struct MobilityEntry {
        string barangay;
        string companyName;
        string timestamp;
        string supportType;
        string emotionalTag;
    }

    MobilityEntry[] public protocol;

    event LaborMobilityChained(string barangay, string companyName, string timestamp, string supportType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function chainMobility(
        string memory barangay,
        string memory companyName,
        string memory timestamp,
        string memory supportType,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(MobilityEntry(barangay, companyName, timestamp, supportType, emotionalTag));
        emit LaborMobilityChained(barangay, companyName, timestamp, supportType, emotionalTag);
    }
}
