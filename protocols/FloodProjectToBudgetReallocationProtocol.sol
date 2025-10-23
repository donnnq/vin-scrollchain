// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodProjectToBudgetReallocationProtocol {
    address public steward;

    struct ReallocationEntry {
        string projectName;
        string region;
        uint256 originalBudget;
        uint256 reallocatedAmount;
        string reallocationTarget; // "Disaster relief", "Infrastructure audit", "Community restoration"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ReallocationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployReallocation(string memory projectName, string memory region, uint256 originalBudget, uint256 reallocatedAmount, string memory reallocationTarget, string memory emotionalTag) external onlySteward {
        entries.push(ReallocationEntry(projectName, region, originalBudget, reallocatedAmount, reallocationTarget, emotionalTag, true, false));
    }

    function sealReallocationEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getReallocationEntry(uint256 index) external view returns (ReallocationEntry memory) {
        return entries[index];
    }
}
