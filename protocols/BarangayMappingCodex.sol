// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMappingCodex {
    address public admin;

    struct MappingEntry {
        string barangayName;
        string hazardZone;
        string mappingClause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    MappingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMapping(string memory barangayName, string memory hazardZone, string memory mappingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MappingEntry(barangayName, hazardZone, mappingClause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealMappingEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getMappingEntry(uint256 index) external view returns (MappingEntry memory) {
        return entries[index];
    }
}
