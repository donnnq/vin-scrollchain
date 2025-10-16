// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForensicAuditImmunityProtocolDAO {
    address public admin;

    struct AuditEntry {
        string auditLabel;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _auditLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_auditLabel, _immunityClause, _emotionalTag, false));
    }

    function protectEntry(uint256 index) external onlyAdmin {
        audits[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
