// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string contractorName;
        string immunityClause;
        string emotionalTag;
        bool blacklisted;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _contractorName, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_contractorName, _immunityClause, _emotionalTag, false));
    }

    function blacklistEntry(uint256 index) external onlyAdmin {
        codex[index].blacklisted = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
