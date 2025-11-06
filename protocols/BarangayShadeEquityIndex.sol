// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayShadeEquityIndex {
    address public steward;

    struct ShadeEntry {
        string barangay;
        string shadeCoverage;
        string equityScore;
        string emotionalTag;
    }

    ShadeEntry[] public index;

    event BarangayShadeEquityTagged(string barangay, string shadeCoverage, string equityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagShadeEquity(
        string memory barangay,
        string memory shadeCoverage,
        string memory equityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ShadeEntry(barangay, shadeCoverage, equityScore, emotionalTag));
        emit BarangayShadeEquityTagged(barangay, shadeCoverage, equityScore, emotionalTag);
    }
}
