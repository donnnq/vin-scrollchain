// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GPUReallocationCodexDAO {
    address public admin;

    struct CodexEntry {
        string dataCenterLabel;
        string reallocationClause;
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

    function submitEntry(string memory _dataCenterLabel, string memory _reallocationClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_dataCenterLabel, _reallocationClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
