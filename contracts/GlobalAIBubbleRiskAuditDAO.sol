// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalAIBubbleRiskAuditDAO {
    address public admin;

    struct AuditEntry {
        string sector;
        string riskClause;
        string emotionalTag;
        bool flagged;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _sector, string memory _riskClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_sector, _riskClause, _emotionalTag, false));
    }

    function flagAudit(uint256 index) external onlyAdmin {
        audits[index].flagged = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
