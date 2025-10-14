// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokEducationDAO {
    address public admin;

    struct EducationEntry {
        string purok;
        string initiative;
        uint256 proposedBudget;
        string emotionalTag;
        bool approved;
    }

    EducationEntry[] public initiatives;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInitiative(string memory _purok, string memory _initiative, uint256 _proposedBudget, string memory _emotionalTag) external onlyAdmin {
        initiatives.push(EducationEntry(_purok, _initiative, _proposedBudget, _emotionalTag, false));
    }

    function approveInitiative(uint256 index) external onlyAdmin {
        initiatives[index].approved = true;
    }

    function getInitiative(uint256 index) external view returns (EducationEntry memory) {
        return initiatives[index];
    }
}
