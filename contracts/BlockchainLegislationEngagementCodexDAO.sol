// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainLegislationEngagementCodexDAO {
    address public admin;

    struct CodexEntry {
        string billLabel;
        string engagementClause;
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

    function submitEntry(string memory _billLabel, string memory _engagementClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_billLabel, _engagementClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
