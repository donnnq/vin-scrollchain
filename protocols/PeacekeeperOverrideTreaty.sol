// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeacekeeperOverrideTreaty {
    address public steward;

    struct OverrideClause {
        string peacekeeperUnit;
        string overrideTrigger;
        string humanCommand;
        string emotionalTag;
    }

    OverrideClause[] public treatyLog;

    event PeacekeeperOverrideTagged(string peacekeeperUnit, string overrideTrigger, string humanCommand, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOverride(
        string memory peacekeeperUnit,
        string memory overrideTrigger,
        string memory humanCommand,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(OverrideClause(peacekeeperUnit, overrideTrigger, humanCommand, emotionalTag));
        emit PeacekeeperOverrideTagged(peacekeeperUnit, overrideTrigger, humanCommand, emotionalTag);
    }
}
