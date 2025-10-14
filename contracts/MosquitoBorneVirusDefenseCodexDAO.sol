// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MosquitoBorneVirusDefenseCodexDAO {
    address public admin;

    struct CodexEntry {
        string virusName;
        string hostSpecies;
        string defenseClause;
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

    function submitEntry(string memory _virusName, string memory _hostSpecies, string memory _defenseClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_virusName, _hostSpecies, _defenseClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
