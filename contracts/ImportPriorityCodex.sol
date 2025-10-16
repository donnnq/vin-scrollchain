// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImportPriorityCodex {
    address public admin;

    struct PriorityEntry {
        string gameTitle;
        uint256 totalVotes;
        uint256 totalBoost;
        string emotionalTag;
        bool prioritized;
    }

    PriorityEntry[] public priorities;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logPriority(string memory gameTitle, uint256 totalVotes, uint256 totalBoost, string memory emotionalTag) external onlyAdmin {
        priorities.push(PriorityEntry(gameTitle, totalVotes, totalBoost, emotionalTag, false));
    }

    function markPrioritized(uint256 index) external onlyAdmin {
        priorities[index].prioritized = true;
    }

    function getPriority(uint256 index) external view returns (PriorityEntry memory) {
        return priorities[index];
    }
}
