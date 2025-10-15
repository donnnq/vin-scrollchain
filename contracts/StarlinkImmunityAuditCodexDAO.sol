// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StarlinkImmunityAuditCodexDAO {
    address public admin;

    struct CodexEntry {
        string compoundLabel;
        string auditClause;
        string emotionalTag;
        bool enforced;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _compoundLabel, string memory _auditClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_compoundLabel, _auditClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
