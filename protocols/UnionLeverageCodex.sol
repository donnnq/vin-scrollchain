// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnionLeverageCodex {
    address public steward;

    struct LeverageClause {
        string unionName;
        string corridor;
        string leverageAction;
        string emotionalTag;
    }

    LeverageClause[] public codex;

    event LeverageTagged(string unionName, string corridor, string leverageAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagLeverage(
        string memory unionName,
        string memory corridor,
        string memory leverageAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LeverageClause(unionName, corridor, leverageAction, emotionalTag));
        emit LeverageTagged(unionName, corridor, leverageAction, emotionalTag);
    }
}
