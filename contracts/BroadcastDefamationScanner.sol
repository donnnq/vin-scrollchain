// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastDefamationScanner {
    address public admin;

    struct DefamationEntry {
        string broadcaster;
        string segmentTitle;
        string emotionalTag;
        bool flagged;
        bool reviewed;
    }

    DefamationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagSegment(string memory broadcaster, string memory segmentTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(DefamationEntry(broadcaster, segmentTitle, emotionalTag, true, false));
    }

    function reviewSegment(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getDefamationEntry(uint256 index) external view returns (DefamationEntry memory) {
        return entries[index];
    }
}
