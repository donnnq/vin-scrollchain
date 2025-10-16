// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfoWarImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string campaignLabel;
        string immunityClause;
        string emotionalTag;
        bool neutralized;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _campaignLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_campaignLabel, _immunityClause, _emotionalTag, false));
    }

    function markNeutralized(uint256 index) external onlyAdmin {
        codex[index].neutralized = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
