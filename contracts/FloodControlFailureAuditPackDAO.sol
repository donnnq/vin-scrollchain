// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlFailureAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string projectLocation;
        string failureClause;
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

    function submitAudit(string memory _projectLocation, string memory _failureClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_projectLocation, _failureClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
