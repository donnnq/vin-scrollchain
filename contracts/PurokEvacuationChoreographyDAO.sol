// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PurokEvacuationChoreographyDAO {
    address public steward;

    struct EvacuationEvent {
        string purok;
        string triggerType; // "Earthquake", "Aftershock", "Landslide"
        string choreographyType; // "Staggered", "Rapid", "Shelter-Linked"
        string emotionalTag;
        uint256 timestamp;
    }

    EvacuationEvent[] public events;

    event EvacuationLogged(
        string purok,
        string triggerType,
        string choreographyType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log evacuation choreography rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEvacuation(
        string memory purok,
        string memory triggerType,
        string memory choreographyType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(EvacuationEvent({
            purok: purok,
            triggerType: triggerType,
            choreographyType: choreographyType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit EvacuationLogged(purok, triggerType, choreographyType, emotionalTag, block.timestamp);
    }

    function getEvacuationByIndex(uint256 index) external view returns (
        string memory purok,
        string memory triggerType,
        string memory choreographyType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        EvacuationEvent memory e = events[index];
        return (
            e.purok,
            e.triggerType,
            e.choreographyType,
            e.emotionalTag,
            e.timestamp
        );
    }
}
