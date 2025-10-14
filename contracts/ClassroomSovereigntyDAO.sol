// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClassroomSovereigntyDAO {
    address public admin;

    struct ClassroomEntry {
        string region;
        uint256 neededRooms;
        uint256 proposedBudget;
        string emotionalTag;
        bool approved;
    }

    ClassroomEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _region, uint256 _neededRooms, uint256 _proposedBudget, string memory _emotionalTag) external onlyAdmin {
        registry.push(ClassroomEntry(_region, _neededRooms, _proposedBudget, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        registry[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (ClassroomEntry memory) {
        return registry[index];
    }
}
