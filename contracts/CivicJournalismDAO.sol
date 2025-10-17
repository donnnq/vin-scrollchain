// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicJournalismDAO {
    address public admin;

    struct JournalismEntry {
        string segmentTitle;
        string civicTheme;
        string emotionalTag;
        bool summoned;
        bool validated;
    }

    JournalismEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJournalism(string memory segmentTitle, string memory civicTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(JournalismEntry(segmentTitle, civicTheme, emotionalTag, true, false));
    }

    function validateSegment(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getJournalismEntry(uint256 index) external view returns (JournalismEntry memory) {
        return entries[index];
    }
}
