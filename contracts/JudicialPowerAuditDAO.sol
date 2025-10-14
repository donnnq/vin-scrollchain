// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialPowerAuditDAO {
    address public admin;

    struct AuditEntry {
        string judgeName;
        string rulingContext;
        string auditClause;
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

    function submitAudit(string memory _judgeName, string memory _rulingContext, string memory _auditClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_judgeName, _rulingContext, _auditClause, _emotionalTag, false));
    }

    function logAudit(uint256 index) external onlyAdmin {
        audits[index].logged = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
