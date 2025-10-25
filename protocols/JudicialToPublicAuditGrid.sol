// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialToPublicAuditGrid {
    address public steward;

    struct AuditEntry {
        string caseType; // "Budget manipulation", "Ghost insertion", "Project selling"
        string institution; // "Congress", "DPWH", "Party-list bloc"
        string auditMethod; // "Scrollchain trace", "Whistleblower report", "Diaspora-led review"
        string emotionalTag;
        bool activated;
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

    function activateAudit(string memory caseType, string memory institution, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(caseType, institution, auditMethod, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
