// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterMappingDAO {
    address public admin;

    struct ShelterEntry {
        string barangay;
        string shelterType; // "Flood Shelter", "Storm Bunker", "Evacuation Hall"
        string mappingClause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    ShelterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonShelter(string memory barangay, string memory shelterType, string memory mappingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ShelterEntry(barangay, shelterType, mappingClause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealShelterEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getShelterEntry(uint256 index) external view returns (ShelterEntry memory) {
        return entries[index];
    }
}
