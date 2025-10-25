// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MercyAssetToFoodEquityProtocol {
    address public steward;

    struct FoodEntry {
        string assetType; // "Vacant tower", "Ghost city unit"
        string repurposeSignal; // "Community kitchen", "Food distribution hub"
        string targetGroup; // "Displaced families", "Urban poor"
        string emotionalTag;
        bool converted;
        bool sealed;
    }

    FoodEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function convertToFoodEquity(string memory assetType, string memory repurposeSignal, string memory targetGroup, string memory emotionalTag) external onlySteward {
        entries.push(FoodEntry(assetType, repurposeSignal, targetGroup, emotionalTag, true, false));
    }

    function sealFoodEntry(uint256 index) external onlySteward {
        require(entries[index].converted, "Must be converted first");
        entries[index].sealed = true;
    }

    function getFoodEntry(uint256 index) external view returns (FoodEntry memory) {
        return entries[index];
    }
}
