// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuarterlySALNFilingProtocol {
    address public admin;

    struct SALNEntry {
        string officialName;
        string position;
        string emotionalTag;
        string filingPeriod; // e.g., Q1 2025, October 2025
        bool filed;
        bool publiclyAccessible;
    }

    SALNEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileSALN(string memory officialName, string memory position, string memory emotionalTag, string memory filingPeriod) external onlyAdmin {
        entries.push(SALNEntry(officialName, position, emotionalTag, filingPeriod, true, false));
    }

    function makePublic(uint256 index) external onlyAdmin {
        entries[index].publiclyAccessible = true;
    }

    function getSALN(uint256 index) external view returns (SALNEntry memory) {
        return entries[index];
    }
}
