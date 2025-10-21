// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalkableGardenCodex {
    address public admin;

    struct GardenEntry {
        string zone;
        string featureType; // "Trees", "Benches", "Pathways"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool planted;
        bool sealed;
    }

    GardenEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGardenFeature(string memory zone, string memory featureType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(GardenEntry(zone, featureType, codexClause, emotionalTag, true, false, false));
    }

    function confirmPlanting(uint256 index) external onlyAdmin {
        entries[index].planted = true;
    }

    function sealGardenEntry(uint256 index) external onlyAdmin {
        require(entries[index].planted, "Must be planted first");
        entries[index].sealed = true;
    }

    function getGardenEntry(uint256 index) external view returns (GardenEntry memory) {
        return entries[index];
    }
}
