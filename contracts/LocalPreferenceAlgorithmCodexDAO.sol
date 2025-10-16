// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalPreferenceAlgorithmCodexDAO {
    address public admin;

    struct CodexEntry {
        string platformLabel;
        string preferenceClause;
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

    function submitEntry(string memory _platformLabel, string memory _preferenceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_platformLabel, _preferenceClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
