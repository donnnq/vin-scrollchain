// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlueRibbonTribunalCodexDAO {
    address public admin;

    struct CodexEntry {
        string tribunalLabel;
        string oversightClause;
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

    function submitEntry(string memory _tribunalLabel, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_tribunalLabel, _oversightClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
