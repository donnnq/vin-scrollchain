// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemeToLegislationTriggerGrid {
    address public steward;

    struct TriggerEntry {
        string memeTitle;
        string civicIssue; // "Senate silence", "Budget opacity", "Dismissal inaction"
        string proposedBill; // "Transparency Act", "Automatic Enforcement Mandate"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    TriggerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerLegislation(string memory memeTitle, string memory civicIssue, string memory proposedBill, string memory emotionalTag) external onlySteward {
        entries.push(TriggerEntry(memeTitle, civicIssue, proposedBill, emotionalTag, true, false));
    }

    function sealTriggerEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getTriggerEntry(uint256 index) external view returns (TriggerEntry memory) {
        return entries[index];
    }
}
