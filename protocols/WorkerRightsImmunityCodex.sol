// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerRightsImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string unionName;
        string corridor;
        string rightsProtected;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event RightsImmunityTagged(string unionName, string corridor, string rightsProtected, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRightsImmunity(
        string memory unionName,
        string memory corridor,
        string memory rightsProtected,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(unionName, corridor, rightsProtected, emotionalTag));
        emit RightsImmunityTagged(unionName, corridor, rightsProtected, emotionalTag);
    }
}
