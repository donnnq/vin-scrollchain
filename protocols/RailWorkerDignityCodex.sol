// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RailWorkerDignityCodex {
    address public steward;

    struct DignityClause {
        string unionName;
        string corridor;
        string dignityAction;
        string emotionalTag;
    }

    DignityClause[] public codex;

    event DignityTagged(string unionName, string corridor, string dignityAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagDignity(
        string memory unionName,
        string memory corridor,
        string memory dignityAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DignityClause(unionName, corridor, dignityAction, emotionalTag));
        emit DignityTagged(unionName, corridor, dignityAction, emotionalTag);
    }
}
