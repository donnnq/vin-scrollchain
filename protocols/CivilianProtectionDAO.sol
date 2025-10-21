// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivilianProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string region;
        string threatType;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool activated;
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

    function summonProtection(string memory region, string memory threatType, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(region, threatType, protectionClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
