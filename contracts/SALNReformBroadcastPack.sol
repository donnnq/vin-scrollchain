// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SALNReformBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string officialName;
        string filingPeriod; // e.g., Q1 2025, October 2025
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

    function submitBroadcast(string memory officialName, string memory filingPeriod, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(officialName, filingPeriod, emotionalTag, false, false));
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
