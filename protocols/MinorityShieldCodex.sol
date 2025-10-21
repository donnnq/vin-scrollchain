// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MinorityShieldCodex {
    address public admin;

    struct ShieldEntry {
        string chamber;
        string protectionType; // "Committee Access", "Hearing Participation", "Leadership Eligibility"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    ShieldEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonShield(string memory chamber, string memory protectionType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ShieldEntry(chamber, protectionType, codexClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealShieldEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getShieldEntry(uint256 index) external view returns (ShieldEntry memory) {
        return entries[index];
    }
}
