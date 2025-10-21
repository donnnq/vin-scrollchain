// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerGearCodex {
    address public admin;

    struct GearEntry {
        string siteName;
        string gearType; // "Helmet", "Reflective Vest", "Boots", "Gloves"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool distributed;
        bool sealed;
    }

    GearEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGear(string memory siteName, string memory gearType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(GearEntry(siteName, gearType, codexClause, emotionalTag, true, false, false));
    }

    function confirmDistribution(uint256 index) external onlyAdmin {
        entries[index].distributed = true;
    }

    function sealGearEntry(uint256 index) external onlyAdmin {
        require(entries[index].distributed, "Must be distributed first");
        entries[index].sealed = true;
    }

    function getGearEntry(uint256 index) external view returns (GearEntry memory) {
        return entries[index];
    }
}
