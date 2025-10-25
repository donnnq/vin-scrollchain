// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureToSenateOversightTreaty {
    address public steward;

    struct OversightEntry {
        string projectName; // "Tagaytay Flyover"
        string issueRaised; // "Overpricing", "Design anomaly", "Transparency gap"
        string senateAction; // "Committee hearing", "Scrollchain testimony", "Public resolution"
        string emotionalTag;
        bool escalated;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function escalateIssue(string memory projectName, string memory issueRaised, string memory senateAction, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(projectName, issueRaised, senateAction, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].escalated, "Must be escalated first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
