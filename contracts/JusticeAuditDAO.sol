// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JusticeAuditDAO {
    address public admin;

    struct AuditEntry {
        string actorName;
        string infraction;
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

    function summonAudit(string memory actorName, string memory infraction, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(actorName, infraction, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
