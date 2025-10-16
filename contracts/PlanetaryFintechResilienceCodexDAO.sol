// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryFintechResilienceCodexDAO {
    address public admin;

    struct CodexEntry {
        string fintechLabel;
        string resilienceClause;
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

    function submitEntry(string memory _fintechLabel, string memory _resilienceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_fintechLabel, _resilienceClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
