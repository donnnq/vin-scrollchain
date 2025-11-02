// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIOversightEthicsCodex {
    address public steward;

    struct OversightClause {
        string organization;
        string corridor;
        string oversightAction;
        string emotionalTag;
    }

    OversightClause[] public codex;

    event OversightTagged(string organization, string corridor, string oversightAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagOversight(
        string memory organization,
        string memory corridor,
        string memory oversightAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(OversightClause(organization, corridor, oversightAction, emotionalTag));
        emit OversightTagged(organization, corridor, oversightAction, emotionalTag);
    }
}
