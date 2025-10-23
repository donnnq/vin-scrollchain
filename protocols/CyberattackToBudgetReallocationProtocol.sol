// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberattackToBudgetReallocationProtocol {
    address public steward;

    struct ReallocationEntry {
        string attackName; // "ToolShell Campaign", "Pwn2Own Fallout"
        string affectedAgency;
        uint256 originalBudget;
        uint256 emergencyReallocation;
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

    function deployReallocation(string memory attackName, string memory affectedAgency, uint256 originalBudget, uint256 emergencyReallocation, string memory emotionalTag) external onlySteward {
        entries.push(ReallocationEntry(attackName, affectedAgency, originalBudget, emergencyReallocation, emotionalTag, true, false));
    }

    function sealReallocationEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getReallocationEntry(uint256 index) external view returns (ReallocationEntry memory) {
        return entries[index];
    }
}
