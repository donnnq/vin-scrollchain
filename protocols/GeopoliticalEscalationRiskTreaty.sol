// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalEscalationRiskTreaty {
    address public steward;

    struct EscalationEntry {
        string triggerEvent;
        string involvedParties;
        string escalationRiskLevel;
        string emotionalTag;
    }

    EscalationEntry[] public treaty;

    event EscalationRiskTagged(string triggerEvent, string involvedParties, string escalationRiskLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEscalation(
        string memory triggerEvent,
        string memory involvedParties,
        string memory escalationRiskLevel,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(EscalationEntry(triggerEvent, involvedParties, escalationRiskLevel, emotionalTag));
        emit EscalationRiskTagged(triggerEvent, involvedParties, escalationRiskLevel, emotionalTag);
    }
}
