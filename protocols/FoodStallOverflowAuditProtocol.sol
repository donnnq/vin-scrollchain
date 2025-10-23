// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodStallOverflowAuditProtocol {
    address public steward;

    struct AuditEntry {
        string location; // "Pasig Esplanade"
        string overflowType; // "Beyond line", "Path obstruction"
        string auditSignal; // "Vendor regulation", "Public safety", "Walkway access"
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

    function auditOverflow(string memory location, string memory overflowType, string memory auditSignal, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(location, overflowType, auditSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
