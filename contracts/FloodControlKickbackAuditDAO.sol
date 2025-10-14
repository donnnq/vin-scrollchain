contract FloodControlKickbackAuditDAO {
    address public admin;

    struct AuditEntry {
        string projectName;
        uint256 budgetAmount;
        string anomalyFlag;
        string emotionalTag;
        bool verified;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    function submitAudit(string memory _projectName, uint256 _budgetAmount, string memory _anomalyFlag, string memory _emotionalTag) external {
        audits.push(AuditEntry(_projectName, _budgetAmount, _anomalyFlag, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
