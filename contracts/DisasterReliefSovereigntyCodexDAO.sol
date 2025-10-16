// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterReliefSovereigntyCodexDAO {
    address public admin;

    struct CodexEntry {
        string regionLabel;
        string reliefClause;
        string emotionalTag;
        bool activated;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _regionLabel, string memory _reliefClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_regionLabel, _reliefClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
