// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTechRaceAuditRegistryDAO {
    address public admin;

    struct AuditEntry {
        string country;
        string techClause;
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

    function submitAudit(string memory _country, string memory _techClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_country, _techClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
