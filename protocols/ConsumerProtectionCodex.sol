// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerProtectionCodex {
    address public admin;

    struct ProtectionEntry {
        string platformName;
        string protectionType;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonProtectionAudit(string memory platformName, string memory protectionType, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(platformName, protectionType, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
