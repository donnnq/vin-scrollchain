// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IndustrialWorkerMemorialCodexDAO {
    address public admin;

    struct CodexEntry {
        string workerName;
        string sector;
        string tributeClause;
        string emotionalTag;
        bool honored;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerName, string memory _sector, string memory _tributeClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_workerName, _sector, _tributeClause, _emotionalTag, false));
    }

    function markHonored(uint256 index) external onlyAdmin {
        codex[index].honored = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
