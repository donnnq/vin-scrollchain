// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeIntegrityAuditRegistryDAO {
    address public admin;

    struct AuditEntry {
        string mediaOutlet;
        string narrativeClause;
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

    function submitAudit(string memory _mediaOutlet, string memory _narrativeClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_mediaOutlet, _narrativeClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
