// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisplacementImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string siteName;
        string displacementContext;
        string immunitySignal;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event DisplacementImmunityTagged(string siteName, string displacementContext, string immunitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory siteName,
        string memory displacementContext,
        string memory immunitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(siteName, displacementContext, immunitySignal, emotionalTag));
        emit DisplacementImmunityTagged(siteName, displacementContext, immunitySignal, emotionalTag);
    }
}
