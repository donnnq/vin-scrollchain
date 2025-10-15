// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAutonomyOverrideCodexDAO {
    address public admin;

    struct CodexEntry {
        string overrideLabel;
        string autonomyClause;
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

    function submitEntry(string memory _overrideLabel, string memory _autonomyClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_overrideLabel, _autonomyClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
