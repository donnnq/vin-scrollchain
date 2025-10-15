// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalWorkerRightsCodexDAO {
    address public admin;

    struct CodexEntry {
        string region;
        string rightsClause;
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

    function submitEntry(string memory _region, string memory _rightsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_region, _rightsClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
