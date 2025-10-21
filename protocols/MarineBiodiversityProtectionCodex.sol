// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarineBiodiversityProtectionCodex {
    address public admin;

    struct ProtectionEntry {
        string marineZone;
        string speciesFocus;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory marineZone, string memory speciesFocus, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(marineZone, speciesFocus, protectionClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
