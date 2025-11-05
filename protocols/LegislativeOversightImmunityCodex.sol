// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeOversightImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string officialName;
        string oversightContext;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event OversightImmunityTagged(string officialName, string oversightContext, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory officialName,
        string memory oversightContext,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteard {
        codex.push(ImmunityClause(officialName, oversightContext, immunityProtocol, emotionalTag));
        emit OversightImmunityTagged(officialName, oversightContext, immunityProtocol, emotionalTag);
    }
}
