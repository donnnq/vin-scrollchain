// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemittanceAuditCodexDAO {
    address public admin;

    struct AuditEntry {
        string remittanceSource;
        string recipientBarangay;
        string emotionalTag;
        string usagePath;
        bool verified;
    }

    AuditEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _remittanceSource, string memory _recipientBarangay, string memory _emotionalTag, string memory _usagePath) external onlyAdmin {
        codex.push(AuditEntry(_remittanceSource, _recipientBarangay, _emotionalTag, _usagePath, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        codex[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return codex[index];
    }
}
