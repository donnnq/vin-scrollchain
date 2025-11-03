// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AICeasefireDAO {
    address public steward;

    struct CeasefireEntry {
        string conflictZone;
        string AIUnitType;
        string ceasefireTrigger;
        string emotionalTag;
    }

    CeasefireEntry[] public registry;

    event AICeasefireTagged(string conflictZone, string AIUnitType, string ceasefireTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCeasefire(
        string memory conflictZone,
        string memory AIUnitType,
        string memory ceasefireTrigger,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CeasefireEntry(conflictZone, AIUnitType, ceasefireTrigger, emotionalTag));
        emit AICeasefireTagged(conflictZone, AIUnitType, ceasefireTrigger, emotionalTag);
    }
}
