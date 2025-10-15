// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfrastructureAuditRegistryDAO {
    address public admin;

    struct AuditEntry {
        string region;
        string infrastructureClause;
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

    function submitAudit(string memory _region, string memory _infrastructureClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_region, _infrastructureClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
