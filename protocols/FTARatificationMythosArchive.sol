// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTARatificationMythosArchive {
    address public admin;

    struct MythosEntry {
        string country; // "Philippines"
        string partner; // "EU", "Canada", "Chile"
        string treatyStatus; // "Signed", "Ratified", "Pending"
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

    function archiveMythos(string memory country, string memory partner, string memory treatyStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(country, partner, treatyStatus, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
