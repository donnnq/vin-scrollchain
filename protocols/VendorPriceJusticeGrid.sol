// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorPriceJusticeGrid {
    address public steward;

    struct VendorEntry {
        string vendorName;
        string productType; // "Rice", "Meat", "Fish", "Vegetables"
        uint256 reportedPrice;
        uint256 fairMarketPrice;
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    VendorEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditVendor(string memory vendorName, string memory productType, uint256 reportedPrice, uint256 fairMarketPrice, string memory emotionalTag) external onlySteward {
        require(reportedPrice > fairMarketPrice, "No price abuse detected");
        entries.push(VendorEntry(vendorName, productType, reportedPrice, fairMarketPrice, emotionalTag, true, false));
    }

    function sealVendorEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getVendorEntry(uint256 index) external view returns (VendorEntry memory) {
        return entries[index];
    }
}
