// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RateCutImpactLedger {
    address public steward;

    struct RateCutEntry {
        string policySignal;
        string marketReaction;
        string fiscalRipple;
        string emotionalTag;
    }

    RateCutEntry[] public ledger;

    event RateCutImpactTagged(string policySignal, string marketReaction, string fiscalRipple, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRateCut(
        string memory policySignal,
        string memory marketReaction,
        string memory fiscalRipple,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RateCutEntry(policySignal, marketReaction, fiscalRipple, emotionalTag));
        emit RateCutImpactTagged(policySignal, marketReaction, fiscalRipple, emotionalTag);
    }
}
