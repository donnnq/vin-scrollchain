// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayToLegislationTracker {
    address public steward;

    struct LegislationEntry {
        string vulnerabilityID;
        string exploitEvent; // "ToolShell Campaign", "Pwn2Own 2025"
        string proposedBillName; // "Cyber Defense Act", "Zero-Day Disclosure Mandate"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    LegislationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackLegislation(string memory vulnerabilityID, string memory exploitEvent, string memory proposedBillName, string memory emotionalTag) external onlySteward {
        entries.push(LegislationEntry(vulnerabilityID, exploitEvent, proposedBillName, emotionalTag, true, false));
    }

    function sealLegislationEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getLegislationEntry(uint256 index) external view returns (LegislationEntry memory) {
        return entries[index];
    }
}
