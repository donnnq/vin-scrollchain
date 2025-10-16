// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryGameResurrectionCodex {
    address public admin;

    struct ResurrectionEntry {
        string gameTitle;
        string revivalMethod;
        string emotionalTag;
        bool revived;
        bool archived;
    }

    ResurrectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitResurrection(string memory gameTitle, string memory revivalMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ResurrectionEntry(gameTitle, revivalMethod, emotionalTag, false, false));
    }

    function markRevived(uint256 index) external onlyAdmin {
        entries[index].revived = true;
    }

    function archiveResurrection(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getResurrection(uint256 index) external view returns (ResurrectionEntry memory) {
        return entries[index];
    }
}
