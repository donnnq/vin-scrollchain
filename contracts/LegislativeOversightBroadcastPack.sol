// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeOversightBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string hearingTitle;
        string agency;
        string issueType;
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

    function submitBroadcast(string memory hearingTitle, string memory agency, string memory issueType, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(hearingTitle, agency, issueType, emotionalTag, false, false));
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
