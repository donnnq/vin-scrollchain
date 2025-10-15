// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicProcurementAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string projectName;
        string procurementClause;
        string emotionalTag;
        bool verified;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _projectName, string memory _procurementClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_projectName, _procurementClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
