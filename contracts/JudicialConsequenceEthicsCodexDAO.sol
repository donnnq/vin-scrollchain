// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceEthicsCodexDAO {
    address public admin;

    struct CodexEntry {
        string caseTitle;
        string ethicsClause;
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

    function submitEntry(string memory _caseTitle, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_caseTitle, _ethicsClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
