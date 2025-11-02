// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRiderWellnessDAO {
    address public steward;

    struct WellnessEntry {
        string barangay;
        string wellnessProgram;
        string partnerClinic;
        string emotionalTag;
    }

    WellnessEntry[] public registry;

    event RiderWellnessTagged(string barangay, string wellnessProgram, string partnerClinic, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRiderWellness(
        string memory barangay,
        string memory wellnessProgram,
        string memory partnerClinic,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WellnessEntry(barangay, wellnessProgram, partnerClinic, emotionalTag));
        emit RiderWellnessTagged(barangay, wellnessProgram, partnerClinic, emotionalTag);
    }
}
