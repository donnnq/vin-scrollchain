// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionTheaterCodex {
    address public admin;

    struct TheaterEntry {
        string platform;
        string threadTitle;
        string civicClause;
        string emotionalTag;
        bool summoned;
        bool dramatized;
        bool sealed;
    }

    TheaterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTheater(string memory platform, string memory threadTitle, string memory civicClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TheaterEntry(platform, threadTitle, civicClause, emotionalTag, true, false, false));
    }

    function confirmDramatization(uint256 index) external onlyAdmin {
        entries[index].dramatized = true;
    }

    function sealTheaterEntry(uint256 index) external onlyAdmin {
        require(entries[index].dramatized, "Must be dramatized first");
        entries[index].sealed = true;
    }

    function getTheaterEntry(uint256 index) external view returns (TheaterEntry memory) {
        return entries[index];
    }
}
