// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownToReformTransitionLedger {
    address public steward;

    struct ReformEntry {
        string agencyName;
        string shutdownImpact; // "Unpaid workers", "Delayed services", "Public backlash"
        string proposedReform; // "Emergency fund", "Auto-pay protocol", "Civic audit"
        string emotionalTag;
        bool logged;
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

    function logReform(string memory agencyName, string memory shutdownImpact, string memory proposedReform, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(agencyName, shutdownImpact, proposedReform, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
