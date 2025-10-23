// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodHoardingDetectionProtocol {
    address public steward;

    struct HoardingEntry {
        string location;
        string productType; // "Bigas", "Karne", "Isda", "Gulay"
        uint256 quantityDetected;
        string detectionMethod; // "Barangay tip", "Drone scan", "Inventory audit"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    HoardingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagHoarding(string memory location, string memory productType, uint256 quantityDetected, string memory detectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(HoardingEntry(location, productType, quantityDetected, detectionMethod, emotionalTag, true, false));
    }

    function sealHoardingEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getHoardingEntry(uint256 index) external view returns (HoardingEntry memory) {
        return entries[index];
    }
}
