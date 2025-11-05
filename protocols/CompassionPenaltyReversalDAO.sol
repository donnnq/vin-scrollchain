// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompassionPenaltyReversalDAO {
    address public steward;

    struct ReversalEntry {
        string penaltyContext;
        string reversalSignal;
        string legalMechanism;
        string emotionalTag;
    }

    ReversalEntry[] public registry;

    event CompassionPenaltyReversed(string penaltyContext, string reversalSignal, string legalMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function reversePenalty(
        string memory penaltyContext,
        string memory reversalSignal,
        string memory legalMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReversalEntry(penaltyContext, reversalSignal, legalMechanism, emotionalTag));
        emit CompassionPenaltyReversed(penaltyContext, reversalSignal, legalMechanism, emotionalTag);
    }
}
