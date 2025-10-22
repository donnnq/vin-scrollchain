// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionAuditTheaterGrid {
    address public admin;

    struct AuditEntry {
        string platform; // "YouTube", "Facebook", "TikTok"
        string threadFocus; // "ICC arrest", "Plunder complaint", "Economic despair"
        string emotionalTag;
        bool audited;
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

    function logAudit(string memory platform, string memory threadFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(platform, threadFocus, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
