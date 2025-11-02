// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborCorridorImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string unionName;
        string corridor;
        string immunityType;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event ImmunityTagged(string unionName, string corridor, string immunityType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagImmunity(
        string memory unionName,
        string memory corridor,
        string memory immunityType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(unionName, corridor, immunityType, emotionalTag));
        emit ImmunityTagged(unionName, corridor, immunityType, emotionalTag);
    }
}
