// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DuterteEraInfrastructureAuditProtocol {
    address public admin;

    struct ProjectEntry {
        string projectName;
        string location;
        string auditType; // "Unfinished", "Overpriced", "Suspended"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ProjectEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory projectName, string memory location, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProjectEntry(projectName, location, auditType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProjectEntry(uint256 index) external view returns (ProjectEntry memory) {
        return entries[index];
    }
}
