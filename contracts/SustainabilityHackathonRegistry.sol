// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SustainabilityHackathonRegistry {
    address public admin;

    struct HackathonEntry {
        string teamName;
        string challengeTheme;
        string emotionalTag;
        bool registered;
        bool pitched;
    }

    HackathonEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerTeam(string memory teamName, string memory challengeTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(HackathonEntry(teamName, challengeTheme, emotionalTag, true, false));
    }

    function markPitched(uint256 index) external onlyAdmin {
        entries[index].pitched = true;
    }

    function getHackathonEntry(uint256 index) external view returns (HackathonEntry memory) {
        return entries[index];
    }
}
