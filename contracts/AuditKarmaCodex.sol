// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string auditType;
        string purokName;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory auditType, string memory purokName, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(auditType, purokName, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
