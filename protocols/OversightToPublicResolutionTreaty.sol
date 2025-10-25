// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OversightToPublicResolutionTreaty {
    address public steward;

    struct ResolutionEntry {
        string projectName; // "Tagaytay Flyover"
        string issueRaised; // "Overpricing", "Design anomaly", "Transparency gap"
        string resolutionMethod; // "Senate hearing", "Scrollchain broadcast", "Public forum"
        string emotionalTag;
        bool resolved;
        bool sealed;
    }

    ResolutionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function resolveIssue(string memory projectName, string memory issueRaised, string memory resolutionMethod, string memory emotionalTag) external onlySteward {
        entries.push(ResolutionEntry(projectName, issueRaised, resolutionMethod, emotionalTag, true, false));
    }

    function sealResolutionEntry(uint256 index) external onlySteward {
        require(entries[index].resolved, "Must be resolved first");
        entries[index].sealed = true;
    }

    function getResolutionEntry(uint256 index) external view returns (ResolutionEntry memory) {
        return entries[index];
    }
}
