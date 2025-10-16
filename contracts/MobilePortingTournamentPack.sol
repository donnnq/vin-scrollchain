// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilePortingTournamentPack {
    address public admin;

    struct TournamentEntry {
        string candidateName;
        string gameTitle;
        string emotionalTag;
        bool submitted;
        bool selected;
    }

    TournamentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory candidateName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(TournamentEntry(candidateName, gameTitle, emotionalTag, true, false));
    }

    function selectWinner(uint256 index) external onlyAdmin {
        entries[index].selected = true;
    }

    function getEntry(uint256 index) external view returns (TournamentEntry memory) {
        return entries[index];
    }
}
