// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipResponsibilityAuditGrid {
    address public steward;

    struct AuditEntry {
        string leaderName; // "Koko Pimentel"
        string role; // "Senate President"
        string caseLinked; // "Joel Villanueva dismissal"
        string auditOutcome; // "Neglect", "Oversight", "Pending review"
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

    function auditLeader(string memory leaderName, string memory role, string memory caseLinked, string memory auditOutcome, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(leaderName, role, caseLinked, auditOutcome, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
