// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperTournamentDAO {
    address public admin;

    struct TournamentEntry {
        string devName;
        string purokLabel;
        string gameTitle;
        string emotionalTag;
        bool registered;
        bool awarded;
    }

    TournamentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerDev(string memory devName, string memory purokLabel, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(TournamentEntry(devName, purokLabel, gameTitle, emotionalTag, true, false));
    }

    function awardDev(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function getEntry(uint256 index) external view returns (TournamentEntry memory) {
        return entries[index];
    }
}
