// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestigativeRedundancyAuditGrid {
    address public admin;

    struct AuditEntry {
        string proposedBody; // "New investigative body under SB No. 1215"
        string existingAgency; // "Ombudsman", "COA"
        string overlapConcern; // "Duplicated mandate", "Jurisdiction conflict"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function auditRedundancy(string memory proposedBody, string memory existingAgency, string memory overlapConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(proposedBody, existingAgency, overlapConcern, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
