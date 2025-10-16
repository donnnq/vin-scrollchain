// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AntifaScholarshipRegistry {
    address public admin;

    struct ScholarshipEntry {
        string scholarLabel;
        string publicationTitle;
        string emotionalTag;
        bool verified;
        bool flagged;
    }

    ScholarshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitScholarship(string memory scholarLabel, string memory publicationTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(ScholarshipEntry(scholarLabel, publicationTitle, emotionalTag, false, false));
    }

    function verifyScholarship(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function flagScholarship(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getScholarship(uint256 index) external view returns (ScholarshipEntry memory) {
        return entries[index];
    }
}
