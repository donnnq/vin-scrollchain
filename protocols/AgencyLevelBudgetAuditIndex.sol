// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgencyLevelBudgetAuditIndex {
    address public steward;

    struct AuditEntry {
        string agencyName;
        uint256 budgetAllocated;
        string auditStatus; // "Complete", "Pending", "Obscured"
        string auditLink;
        string emotionalTag;
        bool indexed;
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

    function indexAudit(string memory agencyName, uint256 budgetAllocated, string memory auditStatus, string memory auditLink, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(agencyName, budgetAllocated, auditStatus, auditLink, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
