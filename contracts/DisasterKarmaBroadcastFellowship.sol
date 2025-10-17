// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterKarmaBroadcastFellowship {
    address public admin;

    struct BroadcastEntry {
        string segmentTitle;
        string disasterType;
        string karmaTheme;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory segmentTitle, string memory disasterType, string memory karmaTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(segmentTitle, disasterType, karmaTheme, emotionalTag, false, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
