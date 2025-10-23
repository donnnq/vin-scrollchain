// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicJusticeDemandIndex {
    address public steward;

    struct DemandEntry {
        string region;
        string justiceIssue; // "Ombudsman enforcement", "Corruption penalty", "Legislative delay"
        uint256 supportPercentage;
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    DemandEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logDemand(string memory region, string memory justiceIssue, uint256 supportPercentage, string memory emotionalTag) external onlySteward {
        require(supportPercentage >= 50, "Must reflect majority sentiment");
        entries.push(DemandEntry(region, justiceIssue, supportPercentage, emotionalTag, true, false));
    }

    function sealDemandEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getDemandEntry(uint256 index) external view returns (DemandEntry memory) {
        return entries[index];
    }
}
