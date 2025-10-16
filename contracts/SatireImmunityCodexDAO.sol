// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string satireLabel;
        string immunityClause;
        string emotionalTag;
        bool granted;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _satireLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_satireLabel, _immunityClause, _emotionalTag, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        codex[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
