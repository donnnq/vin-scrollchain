// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalPortingTournamentPack {
    address public admin;

    struct TournamentEntry {
        string devName;
        string gameTitle;
        string region;
        string emotionalTag;
        bool submitted;
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

    function submitEntry(string memory devName, string memory gameTitle, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TournamentEntry(devName, gameTitle, region, emotionalTag, true, false));
    }

    function awardEntry(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function getEntry(uint256 index) external view returns (TournamentEntry memory) {
        return entries[index];
    }
}
