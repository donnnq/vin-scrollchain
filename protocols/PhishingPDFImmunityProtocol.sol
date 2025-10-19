// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhishingPDFImmunityProtocol {
    address public admin;

    struct PDFEntry {
        string filename;
        string disguiseOrigin;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool sealed;
    }

    PDFEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPDF(string memory filename, string memory disguiseOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(PDFEntry(filename, disguiseOrigin, emotionalTag, true, false, false));
    }

    function flagPDF(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function sealPDF(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getPDFEntry(uint256 index) external view returns (PDFEntry memory) {
        return entries[index];
    }
}
