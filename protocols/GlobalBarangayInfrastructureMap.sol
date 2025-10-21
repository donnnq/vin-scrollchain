// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalBarangayInfrastructureMap {
    address public admin;

    struct MapEntry {
        string barangay;
        string infrastructureType; // "Drainage", "Floodway", "Green Buffer", "Evacuation Route"
        string mapClause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    MapEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMapEntry(string memory barangay, string memory infrastructureType, string memory mapClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MapEntry(barangay, infrastructureType, mapClause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealMapEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getMapEntry(uint256 index) external view returns (MapEntry memory) {
        return entries[index];
    }
}
