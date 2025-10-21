// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialCommentaryAuditCodex {
    address public admin;

    struct CommentaryEntry {
        string commenterHandle;
        string statement;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    CommentaryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCommentary(string memory commenterHandle, string memory statement, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CommentaryEntry(commenterHandle, statement, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealCommentaryEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getCommentaryEntry(uint256 index) external view returns (CommentaryEntry memory) {
        return entries[index];
    }
}
