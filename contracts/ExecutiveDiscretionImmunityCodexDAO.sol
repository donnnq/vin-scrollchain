// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExecutiveDiscretionImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string executiveAction;
        string immunityClause;
        string constitutionalConcern;
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

    function submitEntry(string memory _executiveAction, string memory _immunityClause, string memory _constitutionalConcern, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_executiveAction, _immunityClause, _constitutionalConcern, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
