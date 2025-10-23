// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayNutritionAuditGrid {
    address public steward;

    struct NutritionEntry {
        string barangayName;
        string deficiencyType; // "Protein", "Vegetables", "Iron", "Calcium"
        uint256 affectedHouseholds;
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

    function auditNutrition(string memory barangayName, string memory deficiencyType, uint256 affectedHouseholds, string memory emotionalTag) external onlySteward {
        entries.push(NutritionEntry(barangayName, deficiencyType, affectedHouseholds, emotionalTag, true, false));
    }

    function sealNutritionEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getNutritionEntry(uint256 index) external view returns (NutritionEntry memory) {
        return entries[index];
    }
}
