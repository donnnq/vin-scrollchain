// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksCorruptionAuditDAO {
    address public admin;

    struct AuditEntry {
        string officialName;
        string position;
        string contractorLink;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool resigned;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory officialName, string memory position, string memory contractorLink, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(officialName, position, contractorLink, emotionalTag, true, false, false));
    }

    function flagConflict(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function markResigned(uint256 index) external onlyAdmin {
        entries[index].resigned = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
