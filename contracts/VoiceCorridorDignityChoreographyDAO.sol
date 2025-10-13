// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VoiceCorridorDignityChoreographyDAO {
    address public steward;

    struct DignityEvent {
        string purok;
        string corridorType; // "Inbound", "Outbound", "Tech Support"
        string dignityAction; // "Rest Period", "Mental Health Support", "Compensation"
        string emotionalTag;
        uint256 timestamp;
    }

    DignityEvent[] public events;

    event DignityLogged(
        string purok,
        string corridorType,
        string dignityAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log voice corridor dignity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDignity(
        string memory purok,
        string memory corridorType,
        string memory dignityAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DignityEvent({
            purok: purok,
            corridorType: corridorType,
            dignityAction: dignityAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DignityLogged(purok, corridorType, dignityAction, emotionalTag, block.timestamp);
    }

    function getDignityByIndex(uint256 index) external view returns (
        string memory purok,
        string memory corridorType,
        string memory dignityAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DignityEvent memory d = events[index];
        return (
            d.purok,
            d.corridorType,
            d.dignityAction,
            d.emotionalTag,
            d.timestamp
        );
    }
}
