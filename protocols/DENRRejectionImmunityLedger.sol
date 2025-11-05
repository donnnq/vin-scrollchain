// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DENRRejectionImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string stewardName;
        string rejectionContext;
        string immunitySignal;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event DENRRejectionImmunityTagged(string stewardName, string rejectionContext, string immunitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory stewardName,
        string memory rejectionContext,
        string memory immunitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(stewardName, rejectionContext, immunitySignal, emotionalTag));
        emit DENRRejectionImmunityTagged(stewardName, rejectionContext, immunitySignal, emotionalTag);
    }
}
