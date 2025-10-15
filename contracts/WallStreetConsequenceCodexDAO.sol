// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WallStreetConsequenceCodexDAO {
    address public admin;

    struct CodexEntry {
        string crashLabel;
        string consequenceClause;
        string emotionalTag;
        bool archived;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _crashLabel, string memory _consequenceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_crashLabel, _consequenceClause, _emotionalTag, false));
    }

    function markArchived(uint256 index) external onlyAdmin {
        codex[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
