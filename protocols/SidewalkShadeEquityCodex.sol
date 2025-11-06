// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SidewalkShadeEquityCodex {
    address public steward;

    struct ShadeClause {
        string sidewalkLocation;
        string treeCoverage;
        string pedestrianComfortScore;
        string emotionalTag;
    }

    ShadeClause[] public codex;

    event SidewalkShadeTagged(string sidewalkLocation, string treeCoverage, string pedestrianComfortScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagShadeEquity(
        string memory sidewalkLocation,
        string memory treeCoverage,
        string memory pedestrianComfortScore,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ShadeClause(sidewalkLocation, treeCoverage, pedestrianComfortScore, emotionalTag));
        emit SidewalkShadeTagged(sidewalkLocation, treeCoverage, pedestrianComfortScore, emotionalTag);
    }
}
