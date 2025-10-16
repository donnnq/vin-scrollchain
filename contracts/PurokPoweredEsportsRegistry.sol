// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredEsportsRegistry {
    address public admin;

    struct EsportsEntry {
        string teamName;
        string purokLabel;
        string gameTitle;
        string emotionalTag;
        bool registered;
        bool minted;
    }

    EsportsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerTeam(string memory teamName, string memory purokLabel, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(EsportsEntry(teamName, purokLabel, gameTitle, emotionalTag, true, false));
    }

    function mintBadge(uint256 index) external onlyAdmin {
        entries[index].minted = true;
    }

    function getTeam(uint256 index) external view returns (EsportsEntry memory) {
        return entries[index];
    }
}
