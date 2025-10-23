// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPriceMonitoringGrid {
    address public steward;

    struct PriceEntry {
        string barangayName;
        string productType; // "Bigas", "Karne", "Isda", "Gulay"
        uint256 reportedPrice;
        uint256 verifiedMarketPrice;
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    PriceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logPrice(string memory barangayName, string memory productType, uint256 reportedPrice, uint256 verifiedMarketPrice, string memory emotionalTag) external onlySteward {
        entries.push(PriceEntry(barangayName, productType, reportedPrice, verifiedMarketPrice, emotionalTag, true, false));
    }

    function sealPriceEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getPriceEntry(uint256 index) external view returns (PriceEntry memory) {
        return entries[index];
    }
}
