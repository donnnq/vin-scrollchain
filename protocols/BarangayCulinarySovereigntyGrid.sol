// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCulinarySovereigntyGrid {
    address public admin;

    struct CulinaryEntry {
        string barangay;
        string dishType; // "Protein-Based", "Vegetable-Based", "Heritage Dessert"
        string sovereigntyLayer; // "Local Ingredients", "Youth Chef", "Ancestral Technique"
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    CulinaryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCulinaryGrid(string memory barangay, string memory dishType, string memory sovereigntyLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(CulinaryEntry(barangay, dishType, sovereigntyLayer, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealCulinaryEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getCulinaryEntry(uint256 index) external view returns (CulinaryEntry memory) {
        return entries[index];
    }
}
