// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditTransparencyDAO {
    address public admin;

    struct AuditEntry {
        string auditLabel;
        string transparencyClause;
        string emotionalTag;
        bool published;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _auditLabel, string memory _transparencyClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_auditLabel, _transparencyClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        audits[index].published = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
