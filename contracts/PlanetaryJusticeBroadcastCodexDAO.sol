// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryJusticeBroadcastCodexDAO {
    address public admin;

    struct CodexEntry {
        string broadcastLabel;
        string justiceClause;
        string emotionalTag;
        bool aired;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _broadcastLabel, string memory _justiceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_broadcastLabel, _justiceClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
