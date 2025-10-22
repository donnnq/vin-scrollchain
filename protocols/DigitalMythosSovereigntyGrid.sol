// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalMythosSovereigntyGrid {
    address public admin;

    struct MythosEntry {
        string mythosName; // "Joker Frequency", "Glitch God", "Matrix Grim"
        string originPlatform; // "YouTube", "Comment Section", etc.
        string emotionalTag;
        bool claimed;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function claimMythos(string memory mythosName, string memory originPlatform, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(mythosName, originPlatform, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].claimed, "Must be claimed first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
