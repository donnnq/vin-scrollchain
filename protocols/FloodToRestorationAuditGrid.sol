// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodToRestorationAuditGrid {
    address public steward;

    struct AuditEntry {
        string projectType; // "Flood control"
        string location; // "Bulacan"
        string auditMethod; // "COA forensic review, scrollchain tagging, physical validation"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonAudit(string memory projectType, string memory location, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(projectType, location, auditMethod, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
