// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokChefSovereigntyLedger {
    address public admin;

    struct ChefEntry {
        string name;
        string purokZone;
        string specialtyDish;
        string sovereigntyLayer; // "Ancestral Technique", "Local Ingredient Mastery", "Youth Training"
        string emotionalTag;
        bool summoned;
        bool recognized;
        bool sealed;
    }

    ChefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonChef(string memory name, string memory purokZone, string memory specialtyDish, string memory sovereigntyLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ChefEntry(name, purokZone, specialtyDish, sovereigntyLayer, emotionalTag, true, false, false));
    }

    function confirmRecognition(uint256 index) external onlyAdmin {
        entries[index].recognized = true;
    }

    function sealChefEntry(uint256 index) external onlyAdmin {
        require(entries[index].recognized, "Must be recognized first");
        entries[index].sealed = true;
    }

    function getChefEntry(uint256 index) external view returns (ChefEntry memory) {
        return entries[index];
    }
}
