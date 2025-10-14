// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilidAralanConstructionImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string schoolName;
        string constructionPhase;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerConstruction(string memory _schoolName, string memory _constructionPhase, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_schoolName, _constructionPhase, _immunityClause, _emotionalTag, false));
    }

    function protectConstruction(uint256 index) external onlyAdmin {
        codex[index].protected = true;
    }

    function getConstruction(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
