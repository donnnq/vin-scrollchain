// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiEntityProcurementAuditDAO {
    address public admin;

    struct AuditEntry {
        string region;
        string entityGroup;
        string auditFindings;
        string emotionalTag;
        bool logged;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _region, string memory _entityGroup, string memory _auditFindings, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_region, _entityGroup, _auditFindings, _emotionalTag, false));
    }

    function logAudit(uint256 index) external onlyAdmin {
        audits[index].logged = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
