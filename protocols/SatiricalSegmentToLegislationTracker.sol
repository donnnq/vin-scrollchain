// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatiricalSegmentToLegislationTracker {
    address public steward;

    struct ReformEntry {
        string satiricalSegment;
        string civicIssue;
        string proposedBillName;
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackLegislation(string memory satiricalSegment, string memory civicIssue, string memory proposedBillName, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(satiricalSegment, civicIssue, proposedBillName, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
