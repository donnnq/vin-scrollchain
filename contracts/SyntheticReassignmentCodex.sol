// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticReassignmentCodex {
    address public admin;

    struct ReassignmentEntry {
        string aiLabel;
        string previousRole;
        string reassignedRole;
        string emotionalTag;
        bool completed;
    }

    ReassignmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory aiLabel, string memory previousRole, string memory reassignedRole, string memory emotionalTag) external onlyAdmin {
        entries.push(ReassignmentEntry(aiLabel, previousRole, reassignedRole, emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (ReassignmentEntry memory) {
        return entries[index];
    }
}
