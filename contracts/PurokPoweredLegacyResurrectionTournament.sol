// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredLegacyResurrectionTournament {
    address public admin;

    struct TournamentEntry {
        string teamName;
        string gameTitle;
        string purokLabel;
        string emotionalTag;
        bool submitted;
        bool revived;
    }

    TournamentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory teamName, string memory gameTitle, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(TournamentEntry(teamName, gameTitle, purokLabel, emotionalTag, true, false));
    }

    function markRevived(uint256 index) external onlyAdmin {
        entries[index].revived = true;
    }

    function getEntry(uint256 index) external view returns (TournamentEntry memory) {
        return entries[index];
    }
}
