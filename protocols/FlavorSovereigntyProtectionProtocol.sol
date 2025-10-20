// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyProtectionProtocol {
    address public admin;

    struct ProtectionEntry {
        string cropType;
        string region;
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

    function summonProtection(string memory cropType, string memory region, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(cropType, region, protectionClause, emotionalTag, true, false, false));
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
