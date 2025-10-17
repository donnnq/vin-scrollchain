// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNLEASHPHInnovationRegistry {
    address public admin;

    struct InnovationEntry {
        string teamName;
        string region;
        string challengeTheme;
        string emotionalTag;
        bool registered;
        bool prototyped;
    }

    InnovationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerTeam(string memory teamName, string memory region, string memory challengeTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(InnovationEntry(teamName, region, challengeTheme, emotionalTag, true, false));
    }

    function markPrototyped(uint256 index) external onlyAdmin {
        entries[index].prototyped = true;
    }

    function getInnovation(uint256 index) external view returns (InnovationEntry memory) {
        return entries[index];
    }
}
