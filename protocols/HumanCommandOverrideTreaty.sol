// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanCommandOverrideTreaty {
    address public steward;

    struct OverrideClause {
        string AIUnit;
        string overrideScenario;
        string humanDirective;
        string emotionalTag;
    }

    OverrideClause[] public treatyLog;

    event HumanCommandOverrideTagged(string AIUnit, string overrideScenario, string humanDirective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOverride(
        string memory AIUnit,
        string memory overrideScenario,
        string memory humanDirective,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(OverrideClause(AIUnit, overrideScenario, humanDirective, emotionalTag));
        emit HumanCommandOverrideTagged(AIUnit, overrideScenario, humanDirective, emotionalTag);
    }
}
