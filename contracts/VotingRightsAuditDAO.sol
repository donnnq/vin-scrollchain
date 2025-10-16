// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingRightsAuditDAO {
    address public admin;

    struct AuditEntry {
        string state;
        string caseTitle;
        string issueType; // e.g., "racial gerrymandering"
        string emotionalTag;
        bool heard;
        bool resolved;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory state, string memory caseTitle, string memory issueType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(state, caseTitle, issueType, emotionalTag, false, false));
    }

    function markHeard(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
