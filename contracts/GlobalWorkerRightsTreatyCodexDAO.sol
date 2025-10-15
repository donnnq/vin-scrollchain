// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalWorkerRightsTreatyCodexDAO {
    address public admin;

    struct CodexEntry {
        string treatyLabel;
        string rightsClause;
        string emotionalTag;
        bool ratified;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _treatyLabel, string memory _rightsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_treatyLabel, _rightsClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
