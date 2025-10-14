// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorDiplomacyTribunalDAO {
    address public admin;

    struct Case {
        string dish;
        string culturalOrigin;
        string dispute;
        string resolution;
        bool resolved;
    }

    Case[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _dish, string memory _culturalOrigin, string memory _dispute, string memory _resolution) external onlyAdmin {
        cases.push(Case(_dish, _culturalOrigin, _dispute, _resolution, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (Case memory) {
        return cases[index];
    }
}
