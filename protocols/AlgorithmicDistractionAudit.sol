// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AlgorithmicDistractionAudit {
    address public admin;

    struct DistractionEntry {
        string platform; // "YouTube", "TikTok", "Facebook"
        string civicContent; // "Livestream Protest", "Truth-Telling", "Corruption Exposure"
        string distractionPair; // "Food Shorts", "Celebrity Clips", "Meme Flood"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DistractionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory platform, string memory civicContent, string memory distractionPair, string memory emotionalTag) external onlyAdmin {
        entries.push(DistractionEntry(platform, civicContent, distractionPair, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealDistractionEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDistractionEntry(uint256 index) external view returns (DistractionEntry memory) {
        return entries[index];
    }
}
