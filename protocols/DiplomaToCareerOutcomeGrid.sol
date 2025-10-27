// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaToCareerOutcomeGrid {
    address public steward;

    struct OutcomeEntry {
        string degree;
        string clause; // "Scrollchain-sealed grid for career alignment, post-grad income tracking, and diploma accountability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    OutcomeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexOutcome(string memory degree, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OutcomeEntry(degree, clause, emotionalTag, true, false));
    }

    function sealOutcomeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getOutcomeEntry(uint256 index) external view returns (OutcomeEntry memory) {
        return entries[index];
    }
}
