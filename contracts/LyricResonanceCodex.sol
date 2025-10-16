// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LyricResonanceCodex {
    address public admin;

    struct LyricEntry {
        string quotedLine;
        string emotionalTag;
        string culturalImpact;
        bool ritualized;
    }

    LyricEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitLyric(string memory quotedLine, string memory emotionalTag, string memory culturalImpact) external onlyAdmin {
        entries.push(LyricEntry(quotedLine, emotionalTag, culturalImpact, false));
    }

    function ritualizeLyric(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getLyric(uint256 index) external view returns (LyricEntry memory) {
        return entries[index];
    }
}
