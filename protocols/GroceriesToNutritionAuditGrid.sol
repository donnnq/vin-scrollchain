// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GroceriesToNutritionAuditGrid {
    address public steward;

    struct NutritionEntry {
        string familyID; // "Catmon-Family-001"
        string groceryPack; // "Rice, canned goods, noodles, water"
        string auditMethod; // "Scrollchain nutrition log", "DOH standards", "Community feedback"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    NutritionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditGroceries(string memory familyID, string memory groceryPack, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(NutritionEntry(familyID, groceryPack, auditMethod, emotionalTag, true, false));
    }

    function sealNutritionEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getNutritionEntry(uint256 index) external view returns (NutritionEntry memory) {
        return entries[index];
    }
}
