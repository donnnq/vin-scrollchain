// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkSecurityCodex {
    address public admin;

    struct SecurityEntry {
        string parkName;
        string patrolType;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    SecurityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSecurity(string memory parkName, string memory patrolType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SecurityEntry(parkName, patrolType, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSecurityEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSecurityEntry(uint256 index) external view returns (SecurityEntry memory) {
        return entries[index];
    }
}
