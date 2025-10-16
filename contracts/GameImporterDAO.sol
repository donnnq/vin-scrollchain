// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameImporterDAO {
    address public admin;

    struct ImporterEntry {
        string candidateName;
        string gameTitle;
        string emotionalTag;
        bool approved;
        bool partnered;
    }

    ImporterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitImporter(string memory candidateName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(ImporterEntry(candidateName, gameTitle, emotionalTag, false, false));
    }

    function approveImporter(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function partnerWithImporter(uint256 index) external onlyAdmin {
        entries[index].partnered = true;
    }

    function getImporter(uint256 index) external view returns (ImporterEntry memory) {
        return entries[index];
    }
}
