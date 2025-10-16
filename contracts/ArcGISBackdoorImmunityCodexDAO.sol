// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArcGISBackdoorImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string exploitLabel;
        string immunityClause;
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

    function submitEntry(string memory _exploitLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_exploitLabel, _immunityClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
