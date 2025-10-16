// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvisorLegacyCodexDAO {
    address public admin;

    struct LegacyEntry {
        string advisorLabel;
        string legacyClause;
        string emotionalTag;
        bool archived;
    }

    LegacyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _advisorLabel, string memory _legacyClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(LegacyEntry(_advisorLabel, _legacyClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        codex[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (LegacyEntry memory) {
        return codex[index];
    }
}
