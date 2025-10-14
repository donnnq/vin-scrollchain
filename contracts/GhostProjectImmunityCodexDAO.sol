// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string projectName;
        string detectionMethod;
        string immunityClause;
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

    function submitEntry(string memory _projectName, string memory _detectionMethod, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_projectName, _detectionMethod, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
