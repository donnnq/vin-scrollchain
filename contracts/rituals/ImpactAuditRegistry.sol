pragma mythic;

contract ImpactAuditRegistry {
    struct Audit {
        string projectName;
        string impactSummary;
        string emotionalEcho;
        string auditDate;
    }

    Audit[] public audits;

    event AuditLogged(string projectName, string impactSummary);

    function logAudit(
        string memory _project,
        string memory _summary,
        string memory _echo,
        string memory _date
    ) public {
        audits.push(Audit(_project, _summary, _echo, _date));
        emit AuditLogged(_project, _summary);
    }

    function getAudit(uint index) public view returns (
        string memory, string memory, string memory, string memory
    ) {
        Audit memory a = audits[index];
        return (a.projectName, a.impactSummary, a.emotionalEcho, a.auditDate);
    }
}
