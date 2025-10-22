// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateLivestreamMythosArchive {
    address public admin;

    struct MythosEntry {
        string hearingTitle; // "Infrastructure Anomalies Investigation Act of 2025"
        string mythosSignal; // "Public engagement", "Transparency ritual", "Drilon’s objection"
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

    function archiveMythos(string memory hearingTitle, string memory mythosSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(hearingTitle, mythosSignal, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
