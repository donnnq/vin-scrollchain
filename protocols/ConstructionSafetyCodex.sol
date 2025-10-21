// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructionSafetyCodex {
    address public admin;

    struct SafetyEntry {
        string siteName;
        string safetyType; // "Barrier Placement", "Worker Gear", "Public Signage"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    SafetyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSafety(string memory siteName, string memory safetyType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SafetyEntry(siteName, safetyType, codexClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealSafetyEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
