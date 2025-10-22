// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeConflictAuditGrid {
    address public steward;

    struct AuditEntry {
        string lawmakerName; // "Congress Member", "Senator X"
        string conflictSignal; // "Stock trading while in office", "Policy-benefiting portfolio", "Undisclosed financial interest"
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

    function auditConflict(string memory lawmakerName, string memory conflictSignal, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(lawmakerName, conflictSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
