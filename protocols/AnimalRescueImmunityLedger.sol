// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AnimalRescueImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string stewardName;
        string rescueContext;
        string immunitySignal;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event AnimalRescueImmunityTagged(string stewardName, string rescueContext, string immunitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory stewardName,
        string memory rescueContext,
        string memory immunitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(stewardName, rescueContext, immunitySignal, emotionalTag));
        emit AnimalRescueImmunityTagged(stewardName, rescueContext, immunitySignal, emotionalTag);
    }
}
