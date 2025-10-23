// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignGoodsFallbackRegistry {
    address public steward;

    struct FallbackEntry {
        string productType; // "Beef", "Grain", "Medicine"
        string importSource; // "Argentina", "China", "India"
        string fallbackCondition; // "Local shortage", "Disaster relief", "Market failure"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    FallbackEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerFallback(string memory productType, string memory importSource, string memory fallbackCondition, string memory emotionalTag) external onlySteward {
        entries.push(FallbackEntry(productType, importSource, fallbackCondition, emotionalTag, true, false));
    }

    function sealFallbackEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getFallbackEntry(uint256 index) external view returns (FallbackEntry memory) {
        return entries[index];
    }
}
