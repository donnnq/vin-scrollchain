// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalWageRebalancingCodexDAO {
    address public admin;

    struct RebalanceEntry {
        string wageTier;
        string rebalancingClause;
        string emotionalTag;
        bool sealed;
    }

    RebalanceEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _wageTier, string memory _rebalancingClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(RebalanceEntry(_wageTier, _rebalancingClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (RebalanceEntry memory) {
        return codex[index];
    }
}
