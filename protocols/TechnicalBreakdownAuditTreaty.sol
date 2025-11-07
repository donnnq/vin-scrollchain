// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TechnicalBreakdownAuditTreaty {
    address public steward;

    struct Breakdown {
        string asset;
        string indicator;
        string threshold;
        string breachDate;
        string impactLevel;
        string emotionalTag;
    }

    Breakdown[] public treaty;

    event BreakdownLogged(string asset, string indicator, string threshold, string breachDate, string impactLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logBreakdown(
        string memory asset,
        string memory indicator,
        string memory threshold,
        string memory breachDate,
        string memory impactLevel,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(Breakdown(asset, indicator, threshold, breachDate, impactLevel, emotionalTag));
        emit BreakdownLogged(asset, indicator, threshold, breachDate, impactLevel, emotionalTag);
    }
}
