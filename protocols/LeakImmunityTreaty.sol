// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeakImmunityTreaty {
    address public steward;

    struct ImmunityClause {
        string actor;
        string corridor;
        string immunityLevel;
        string emotionalTag;
    }

    ImmunityClause[] public treatyLog;

    event ImmunityGranted(string actor, string corridor, string immunityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory actor,
        string memory corridor,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ImmunityClause(actor, corridor, immunityLevel, emotionalTag));
        emit ImmunityGranted(actor, corridor, immunityLevel, emotionalTag);
    }
}
