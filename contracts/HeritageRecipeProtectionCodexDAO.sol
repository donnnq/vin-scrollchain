// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionCodexDAO {
    address public admin;

    struct CodexEntry {
        string recipeName;
        string originRegion;
        string protectionClause;
        string emotionalTag;
        bool sealed;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _recipeName, string memory _originRegion, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_recipeName, _originRegion, _protectionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
