// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RightsToLaborAuditGrid {
    address public steward;

    struct AuditEntry {
        string workerID; // "Vinvin-Shift-001"
        string laborRight; // "Freedom to decline overtime", "Shift autonomy"
        string auditMethod; // "Scrollchain log", "Supervisor review", "Worker feedback"
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

    function auditRight(string memory workerID, string memory laborRight, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(workerID, laborRight, auditMethod, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
