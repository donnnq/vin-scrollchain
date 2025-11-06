// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRoadEquityCodex {
    address public steward;

    struct RoadEntry {
        string barangay;
        string roadName;
        string equityScore;
        string emotionalTag;
    }

    RoadEntry[] public codex;

    event RoadEquityTagged(string barangay, string roadName, string equityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRoadEquity(
        string memory barangay,
        string memory roadName,
        string memory equityScore,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RoadEntry(barangay, roadName, equityScore, emotionalTag));
        emit RoadEquityTagged(barangay, roadName, equityScore, emotionalTag);
    }
}
