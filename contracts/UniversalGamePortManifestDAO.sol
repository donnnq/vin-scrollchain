// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversalGamePortManifestDAO {
    address public admin;

    struct GamePortEntry {
        string gameTitle;
        string portStatus;
        string emotionalTag;
        bool approved;
    }

    GamePortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory gameTitle, string memory portStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(GamePortEntry(gameTitle, portStatus, emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (GamePortEntry memory) {
        return entries[index];
    }
}
