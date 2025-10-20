// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRestitutionCodex {
    address public admin;

    struct RestitutionEntry {
        string barangayName;
        string damageType;
        string restitutionClause;
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    RestitutionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestitution(string memory barangayName, string memory damageType, string memory restitutionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RestitutionEntry(barangayName, damageType, restitutionClause, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealRestitutionEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRestitutionEntry(uint256 index) external view returns (RestitutionEntry memory) {
        return entries[index];
    }
}
