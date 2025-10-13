// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RecessionChoreographyDAO {
    address public steward;

    struct RecessionEvent {
        string country;
        string triggerType; // "Crash", "Policy Error", "Global Contagion"
        string choreographyAction; // "Wage Buffer", "Stimulus Ritual", "Narrative Containment"
        string emotionalTag;
        uint256 timestamp;
    }

    RecessionEvent[] public events;

    event RecessionLogged(
        string country,
        string triggerType,
        string choreographyAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log recession choreography rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecession(
        string memory country,
        string memory triggerType,
        string memory choreographyAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RecessionEvent({
            country: country,
            triggerType: triggerType,
            choreographyAction: choreographyAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecessionLogged(country, triggerType, choreographyAction, emotionalTag, block.timestamp);
    }

    function getRecessionByIndex(uint256 index) external view returns (
        string memory country,
        string memory triggerType,
        string memory choreographyAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RecessionEvent memory r = events[index];
        return (
            r.country,
            r.triggerType,
            r.choreographyAction,
            r.emotionalTag,
            r.timestamp
        );
    }
}
