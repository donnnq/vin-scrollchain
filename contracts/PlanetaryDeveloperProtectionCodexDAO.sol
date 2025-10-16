// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDeveloperProtectionCodexDAO {
    address public admin;

    struct CodexEntry {
        string devLabel;
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

    function submitEntry(string memory _devLabel, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_devLabel, _protectionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
