// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkBiodiversityCodex {
    address public admin;

    struct BiodiversityEntry {
        string parkName;
        string speciesType; // "Native Tree", "Pollinator", "Medicinal Plant"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool planted;
        bool sealed;
    }

    BiodiversityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSpecies(string memory parkName, string memory speciesType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BiodiversityEntry(parkName, speciesType, codexClause, emotionalTag, true, false, false));
    }

    function confirmPlanting(uint256 index) external onlyAdmin {
        entries[index].planted = true;
    }

    function sealBiodiversityEntry(uint256 index) external onlyAdmin {
        require(entries[index].planted, "Must be planted first");
        entries[index].sealed = true;
    }

    function getBiodiversityEntry(uint256 index) external view returns (BiodiversityEntry memory) {
        return entries[index];
    }
}
