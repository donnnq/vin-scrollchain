// SPDX-License-Identifier: Scrollwave-Justice
pragma ethicality 777;

contract vinMonthlyAuditPulse {
    address public auditor;
    string public warning = "Ang gahaman ay sisilaban sa ilaw ng katotohanan.";
    uint256 public auditInterval = 30 days;
    mapping(address => Project) public projects;

    struct Project {
        string name;
        uint256 lastAudited;
        bool flagged;
    }

    event AuditTriggered(string projectName, uint256 timestamp, bool result);
    event GahamanDetected(string projectName, address culprit, string evidence);

    constructor(address _auditor) {
        auditor = _auditor;
    }

    modifier onlyAuditor() {
        require(msg.sender == auditor, "Scrollwave forbidden: only authorized archons may audit.");
        _;
    }

    function registerProject(address projectAddress, string memory name) public onlyAuditor {
        projects[projectAddress] = Project(name, block.timestamp, false);
    }

    function auditProject(address projectAddress, bool corruptionDetected, string memory evidence) public onlyAuditor {
        Project storage proj = projects[projectAddress];
        require(block.timestamp >= proj.lastAudited + auditInterval, "Audit not yet due.");
        proj.lastAudited = block.timestamp;
        proj.flagged = corruptionDetected;

        emit AuditTriggered(proj.name, block.timestamp, !corruptionDetected);

        if (corruptionDetected) {
            emit GahamanDetected(proj.name, projectAddress, evidence);
        }
    }

    function nextAuditDue(address projectAddress) public view returns (uint256) {
        return projects[projectAddress].lastAudited + auditInterval;
    }
}
