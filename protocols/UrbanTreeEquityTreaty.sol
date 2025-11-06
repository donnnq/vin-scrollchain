// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanTreeEquityTreaty {
    address public steward;

    struct EquityClause {
        string zone;
        string treeCoverage;
        string equityScore;
        string emotionalTag;
    }

    EquityClause[] public treatyLog;

    event TreeEquityTagged(string zone, string treeCoverage, string equityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTreeEquity(
        string memory zone,
        string memory treeCoverage,
        string memory equityScore,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EquityClause(zone, treeCoverage, equityScore, emotionalTag));
        emit TreeEquityTagged(zone, treeCoverage, equityScore, emotionalTag);
    }
}
