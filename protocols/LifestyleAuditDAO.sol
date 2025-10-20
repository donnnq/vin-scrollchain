// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LifestyleAuditDAO {
    address public admin;

    struct AuditEntry {
        string officialName;
        string auditYear;
        string discrepancyType;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory officialName, string memory auditYear, string memory discrepancyType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(officialName, auditYear, discrepancyType, emotionalTag, true, false, false));
    }

    function confirmFlag(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
