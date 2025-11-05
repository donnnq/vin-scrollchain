// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliceQuotaImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string officerName;
        string enforcementContext;
        string quotaSignal;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event QuotaImmunityTagged(string officerName, string enforcementContext, string quotaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory officerName,
        string memory enforcementContext,
        string memory quotaSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(officerName, enforcementContext, quotaSignal, emotionalTag));
        emit QuotaImmunityTagged(officerName, enforcementContext, quotaSignal, emotionalTag);
    }
}
