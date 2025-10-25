// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokToUtilityPricingIndex {
    address public steward;

    struct PricingEntry {
        string purokZone; // "Northville 8", "Barangay Bangkal"
        string serviceType; // "Water", "Electricity", "Internet"
        string pricingModel; // "Tiered subsidy", "Zero-fee for indigents", "Community rate"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    PricingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexPricing(string memory purokZone, string memory serviceType, string memory pricingModel, string memory emotionalTag) external onlySteward {
        entries.push(PricingEntry(purokZone, serviceType, pricingModel, emotionalTag, true, false));
    }

    function sealPricingEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getPricingEntry(uint256 index) external view returns (PricingEntry memory) {
        return entries[index];
    }
}
