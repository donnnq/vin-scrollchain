// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubpoenaToContractorTestimonyProtocol {
    address public steward;

    struct TestimonyEntry {
        string contractorName; // "FloodTech Builders Inc."
        string testimonyType; // "Senate hearing", "IPC inquiry", "Scrollchain deposition"
        string anomalyContext; // "Ghost bidding", "Overpricing", "Fund diversion"
        string emotionalTag;
        bool testified;
        bool sealed;
    }

    TestimonyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logTestimony(string memory contractorName, string memory testimonyType, string memory anomalyContext, string memory emotionalTag) external onlySteward {
        entries.push(TestimonyEntry(contractorName, testimonyType, anomalyContext, emotionalTag, true, false));
    }

    function sealTestimonyEntry(uint256 index) external onlySteward {
        require(entries[index].testified, "Must be testified first");
        entries[index].sealed = true;
    }

    function getTestimonyEntry(uint256 index) external view returns (TestimonyEntry memory) {
        return entries[index];
    }
}
