// PublicAudits.sol
pragma solidity ^0.8.0;

contract PublicAudits {
    struct Audit {
        uint256 id;
        string principle;   // e.g. "Ensure Public Oversight"
        string measure;     // e.g. "Publish transparent audit logs of voting systems"
        uint256 timestamp;
    }

    uint256 public auditCount;
    mapping(uint256 => Audit) public audits;

    event AuditLogged(uint256 id, string principle, string measure);

    function logAudit(string memory principle, string memory measure) public {
        auditCount++;
        audits[auditCount] = Audit(auditCount, principle, measure, block.timestamp);
        emit AuditLogged(auditCount, principle, measure);
    }
}
