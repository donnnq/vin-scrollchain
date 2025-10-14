// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingJusticeTribunalDAO {
    address public admin;

    struct Case {
        string projectName;
        string accusedEntity;
        string violationType;
        string emotionalTag;
        bool referredToCourt;
    }

    Case[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _projectName, string memory _accusedEntity, string memory _violationType, string memory _emotionalTag) external onlyAdmin {
        cases.push(Case(_projectName, _accusedEntity, _violationType, _emotionalTag, false));
    }

    function referToCourt(uint256 index) external onlyAdmin {
        cases[index].referredToCourt = true;
    }

    function getCase(uint256 index) external view returns (Case memory) {
        return cases[index];
    }
}
