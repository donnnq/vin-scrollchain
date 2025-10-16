// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoluntaryTaxSovereigntyCodexDAO {
    address public admin;

    struct CodexEntry {
        string contributorLabel;
        string consentClause;
        string emotionalTag;
        bool declared;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _contributorLabel, string memory _consentClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_contributorLabel, _consentClause, _emotionalTag, false));
    }

    function markDeclared(uint256 index) external onlyAdmin {
        codex[index].declared = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
