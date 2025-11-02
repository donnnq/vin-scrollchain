// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLivestockDAO {
    address public steward;

    struct LivestockEntry {
        string barangay;
        string animalType;
        string carePartner;
        string emotionalTag;
    }

    LivestockEntry[] public registry;

    event LivestockTagged(string barangay, string animalType, string carePartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLivestock(
        string memory barangay,
        string memory animalType,
        string memory carePartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LivestockEntry(barangay, animalType, carePartner, emotionalTag));
        emit LivestockTagged(barangay, animalType, carePartner, emotionalTag);
    }
}
