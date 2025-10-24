// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToFoodStampRegistry {
    address public steward;

    struct FoodStampEntry {
        string barangayName; // "Bangkal Northville 8"
        uint householdCount;
        string program; // "Walang Gutom Program", "REFUEL"
        string distributionMode; // "e-voucher", "physical card"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    FoodStampEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerFoodStamp(string memory barangayName, uint householdCount, string memory program, string memory distributionMode, string memory emotionalTag) external onlySteward {
        entries.push(FoodStampEntry(barangayName, householdCount, program, distributionMode, emotionalTag, true, false));
    }

    function sealFoodStampEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getFoodStampEntry(uint256 index) external view returns (FoodStampEntry memory) {
        return entries[index];
    }
}
