// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectTribunalCodexDAO {
    address public admin;

    struct CodexEntry {
        string projectName;
        string tribunalClause;
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

    function submitEntry(string memory _projectName, string memory _tribunalClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_projectName, _tribunalClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
