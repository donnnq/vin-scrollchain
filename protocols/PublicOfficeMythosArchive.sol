// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicOfficeMythosArchive {
    address public admin;

    struct MythosEntry {
        string officialName;
        string role;
        string mythicMoment; // "Shortest tenure", "Dignified exit", "Comment section resonance"
        string emotionalTag;
        bool archived;
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

    function archiveMythos(string memory officialName, string memory role, string memory mythicMoment, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(officialName, role, mythicMoment, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
