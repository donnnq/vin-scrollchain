// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string whistleblowerName;
        string corridor;
        string immunityType;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event ImmunityTagged(string whistleblowerName, string corridor, string immunityType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagImmunity(
        string memory whistleblowerName,
        string memory corridor,
        string memory immunityType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(whistleblowerName, corridor, immunityType, emotionalTag));
        emit ImmunityTagged(whistleblowerName, corridor, immunityType, emotionalTag);
    }
}
