// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulturalImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string culturalAsset;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _culturalAsset, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_culturalAsset, _immunityClause, _emotionalTag, false));
    }

    function markProtected(uint256 index) external onlyAdmin {
        codex[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
