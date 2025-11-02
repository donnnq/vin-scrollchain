// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalOversightKarmaCodex {
    address public steward;

    struct OversightClause {
        string committeeName;
        string corridor;
        string oversightAction;
        string karmaVerdict;
        string emotionalTag;
    }

    OversightClause[] public codex;

    event OversightTagged(string committeeName, string corridor, string oversightAction, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagOversight(
        string memory committeeName,
        string memory corridor,
        string memory oversightAction,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(OversightClause(committeeName, corridor, oversightAction, karmaVerdict, emotionalTag));
        emit OversightTagged(committeeName, corridor, oversightAction, karmaVerdict, emotionalTag);
    }
}
