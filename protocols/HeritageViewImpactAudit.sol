// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageViewImpactAudit {
    address public admin;

    struct AuditEntry {
        string projectName; // "Pasig River Expressway"
        string heritageSite; // "Intramuros", "Escolta", "Paco Park"
        string impactType; // "Visual obstruction", "Noise pollution", "Access disruption"
        string auditSignal; // "Design revision", "Buffer zone enforcement", "Cultural consultation"
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

    function auditImpact(string memory projectName, string memory heritageSite, string memory impactType, string memory auditSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectName, heritageSite, impactType, auditSignal, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
