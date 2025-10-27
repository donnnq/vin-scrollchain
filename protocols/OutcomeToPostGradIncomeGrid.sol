// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OutcomeToPostGradIncomeGrid {
    address public steward;

    struct IncomeEntry {
        string degree;
        string clause; // "Scrollchain-sealed grid for post-grad income tracking, career mismatch indexing, and diploma accountability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexIncome(string memory degree, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(IncomeEntry(degree, clause, emotionalTag, true, false));
    }

    function sealIncomeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
