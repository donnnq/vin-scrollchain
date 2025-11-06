// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeBalanceCodex {
    address public steward;

    struct RuleChangeClause {
        string ruleName;
        string changeType;
        string democraticImpact;
        string emotionalTag;
    }

    RuleChangeClause[] public codex;

    event RuleChangeTagged(string ruleName, string changeType, string democraticImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRuleChange(
        string memory ruleName,
        string memory changeType,
        string memory democraticImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RuleChangeClause(ruleName, changeType, democraticImpact, emotionalTag));
        emit RuleChangeTagged(ruleName, changeType, democraticImpact, emotionalTag);
    }
}
