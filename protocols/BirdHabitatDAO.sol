// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BirdHabitatDAO {
    address public admin;

    struct HabitatEntry {
        string forestZone;
        string speciesFocus; // "Maya", "Kingfisher", "Egret", "Migratory Mix"
        string habitatClause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    HabitatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHabitat(string memory forestZone, string memory speciesFocus, string memory habitatClause, string memory emotionalTag) external onlyAdmin {
        entries.push(HabitatEntry(forestZone, speciesFocus, habitatClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealHabitatEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getHabitatEntry(uint256 index) external view returns (HabitatEntry memory) {
        return entries[index];
    }
}
