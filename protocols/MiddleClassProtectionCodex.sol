// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiddleClassProtectionCodex {
    address public admin;

    struct ProtectionEntry {
        string demographicGroup;
        string fiscalThreat;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool shielded;
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

    function summonProtection(string memory demographicGroup, string memory fiscalThreat, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(demographicGroup, fiscalThreat, protectionClause, emotionalTag, true, false, false));
    }

    function confirmShielding(uint256 index) external onlyAdmin {
        entries[index].shielded = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].shielded, "Must be shielded first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
