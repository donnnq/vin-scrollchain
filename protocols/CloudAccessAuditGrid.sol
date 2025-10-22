// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CloudAccessAuditGrid {
    address public steward;

    struct AuditEntry {
        string accessType; // "OAuth token", "Third-party app", "VPN-masked login"
        string auditSignal; // "Unusual location", "Persistent access", "Permission escalation"
        string emotionalTag;
        bool audited;
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

    function auditAccess(string memory accessType, string memory auditSignal, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(accessType, auditSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
