// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BiotechMoonshotAuditDAO {
    address public admin;

    struct AuditEntry {
        string companyName;
        string trialName;
        string emotionalTag;
        bool summoned;
        bool validated;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory companyName, string memory trialName, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(companyName, trialName, emotionalTag, true, false));
    }

    function validateAudit(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
