// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalLaborEquityCodexDAO {
    address public admin;

    struct CodexEntry {
        string laborSector;
        string equityClause;
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

    function submitEntry(string memory _laborSector, string memory _equityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_laborSector, _equityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
