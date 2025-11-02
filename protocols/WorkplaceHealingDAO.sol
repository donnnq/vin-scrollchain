// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkplaceHealingDAO {
    address public steward;

    struct HealingEntry {
        string incidentType;
        string healingAction;
        string crewResponse;
        string emotionalTag;
    }

    HealingEntry[] public registry;

    event WorkplaceHealingTagged(string incidentType, string healingAction, string crewResponse, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHealing(
        string memory incidentType,
        string memory healingAction,
        string memory crewResponse,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HealingEntry(incidentType, healingAction, crewResponse, emotionalTag));
        emit WorkplaceHealingTagged(incidentType, healingAction, crewResponse, emotionalTag);
    }
}
