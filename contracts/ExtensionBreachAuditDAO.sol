// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExtensionBreachAuditDAO {
    address public admin;

    struct AuditEntry {
        string extensionLabel;
        string breachClause;
        string emotionalTag;
        bool audited;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _extensionLabel, string memory _breachClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_extensionLabel, _breachClause, _emotionalTag, false));
    }

    function auditEntry(uint256 index) external onlyAdmin {
        audits[index].audited = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
