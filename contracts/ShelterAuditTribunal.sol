// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterAuditTribunal {
    address public admin;

    struct AuditEntry {
        string shelterName;
        string purokName;
        string auditConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory shelterName, string memory purokName, string memory auditConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(shelterName, purokName, auditConcern, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
