// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberConsequenceDAO {
    address public steward;

    struct ConsequenceEntry {
        string actor;
        string corridor;
        string consequenceType;
        string emotionalTag;
    }

    ConsequenceEntry[] public registry;

    event ConsequenceTagged(string actor, string corridor, string consequenceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagConsequence(
        string memory actor,
        string memory corridor,
        string memory consequenceType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ConsequenceEntry(actor, corridor, consequenceType, emotionalTag));
        emit ConsequenceTagged(actor, corridor, consequenceType, emotionalTag);
    }
}
