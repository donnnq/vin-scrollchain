// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFarmingMandateDAO {
    address public steward;

    struct FarmingEntry {
        string barangay;
        string contributionType;
        string sharedWithBarangay;
        string emotionalTag;
    }

    FarmingEntry[] public registry;

    event FarmingMandated(string barangay, string contributionType, string sharedWithBarangay, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mandateFarming(
        string memory barangay,
        string memory contributionType,
        string memory sharedWithBarangay,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FarmingEntry(barangay, contributionType, sharedWithBarangay, emotionalTag));
        emit FarmingMandated(barangay, contributionType, sharedWithBarangay, emotionalTag);
    }
}
