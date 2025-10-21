// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KapusoSegmentImpactIndex {
    address public admin;

    struct SegmentEntry {
        string segmentTitle;
        string anchorName;
        string impactLayer; // "Public Sentiment", "Policy Response", "Family Mobilization"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    SegmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSegment(string memory segmentTitle, string memory anchorName, string memory impactLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(SegmentEntry(segmentTitle, anchorName, impactLayer, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealSegmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getSegmentEntry(uint256 index) external view returns (SegmentEntry memory) {
        return entries[index];
    }
}
