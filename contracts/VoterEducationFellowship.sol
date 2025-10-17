// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterEducationFellowship {
    address public admin;

    struct EducationEntry {
        string region;
        string civicTheme;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    EducationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateEducation(string memory region, string memory civicTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(EducationEntry(region, civicTheme, emotionalTag, true, false));
    }

    function reinforceEducation(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getEducation(uint256 index) external view returns (EducationEntry memory) {
        return entries[index];
    }
}
