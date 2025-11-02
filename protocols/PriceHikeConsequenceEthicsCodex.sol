// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceHikeConsequenceEthicsCodex {
    address public steward;

    struct ConsequenceClause {
        string affectedSector;
        string mergerTrigger;
        string consequenceType;
        string emotionalTag;
    }

    ConsequenceClause[] public codex;

    event ConsequenceTagged(string affectedSector, string mergerTrigger, string consequenceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagConsequence(
        string memory affectedSector,
        string memory mergerTrigger,
        string memory consequenceType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ConsequenceClause(affectedSector, mergerTrigger, consequenceType, emotionalTag));
        emit ConsequenceTagged(affectedSector, mergerTrigger, consequenceType, emotionalTag);
    }
}
