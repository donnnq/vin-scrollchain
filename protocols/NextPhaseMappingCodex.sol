// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NextPhaseMappingCodex {
    address public admin;

    struct PhaseEntry {
        string segment; // "Arroceros", "Ayala Bridge", "Quezon Bridge"
        string upgradeType; // "Walkway", "Lighting", "Bench", "Shade"
        string mappingClause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    PhaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPhase(string memory segment, string memory upgradeType, string memory mappingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PhaseEntry(segment, upgradeType, mappingClause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealPhaseEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getPhaseEntry(uint256 index) external view returns (PhaseEntry memory) {
        return entries[index];
    }
}
