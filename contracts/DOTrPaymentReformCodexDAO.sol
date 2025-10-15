// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DOTrPaymentReformCodexDAO {
    address public admin;

    struct CodexEntry {
        string agencyLabel;
        string reformClause;
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

    function submitEntry(string memory _agencyLabel, string memory _reformClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_agencyLabel, _reformClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
