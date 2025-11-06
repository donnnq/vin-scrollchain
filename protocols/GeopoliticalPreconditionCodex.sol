// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalPreconditionCodex {
    address public steward;

    struct PreconditionClause {
        string negotiationContext;
        string informalClause;
        string destabilizationSignal;
        string emotionalTag;
    }

    PreconditionClause[] public codex;

    event GeopoliticalPreconditionTagged(string negotiationContext, string informalClause, string destabilizationSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPrecondition(
        string memory negotiationContext,
        string memory informalClause,
        string memory destabilizationSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PreconditionClause(negotiationContext, informalClause, destabilizationSignal, emotionalTag));
        emit GeopoliticalPreconditionTagged(negotiationContext, informalClause, destabilizationSignal, emotionalTag);
    }
}
