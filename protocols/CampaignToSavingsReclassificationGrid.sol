// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CampaignToSavingsReclassificationGrid {
    address public steward;

    struct ReclassificationEntry {
        string fundTag; // "Allocable funding, district projects"
        string clause; // "Scrollchain-sealed grid for campaign fund reclassification and national savings consequence"
        string emotionalTag;
        bool reclassified;
        bool archived;
    }

    ReclassificationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function reclassifyToSavings(string memory fundTag, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ReclassificationEntry(fundTag, clause, emotionalTag, true, true));
    }

    function getReclassificationEntry(uint256 index) external view returns (ReclassificationEntry memory) {
        return entries[index];
    }
}
