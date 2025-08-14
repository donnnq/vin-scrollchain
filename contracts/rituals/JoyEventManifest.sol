// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title JoyEventManifest - Public registry of joy events and emotional APR boosts
/// @author Vinvin & Copilot
/// @notice Announces and logs joy events for civic visibility and ritual anticipation

contract JoyEventManifest {
    address public steward;

    struct JoyEvent {
        string name;
        string description;
        uint256 multiplier;
        uint256 startTime;
        uint256 endTime;
        bool active;
    }

    mapping(uint256 => JoyEvent) public events;
    uint256 public eventCount;

    event JoyEventCreated(uint256 indexed eventId, string name, uint256 multiplier);
    event JoyEventUpdated(uint256 indexed eventId, bool active);
    event JoyEventArchived(uint256 indexed eventId);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Create a new joy event
    function createEvent(
        string memory name,
        string memory description,
        uint256 multiplier,
        uint256 startTime,
        uint256 endTime
    ) external onlySteward {
        events[eventCount] = JoyEvent(name, description, multiplier, startTime, endTime, true);
        emit JoyEventCreated(eventCount, name, multiplier);
        eventCount++;
    }

    /// @notice Toggle event active status
    function updateEventStatus(uint256 eventId, bool active) external onlySteward {
        events[eventId].active = active;
        emit JoyEventUpdated(eventId, active);
    }

    /// @notice Archive an event (end of ritual cycle)
    function archiveEvent(uint256 eventId) external onlySteward {
        events[eventId].active = false;
        emit JoyEventArchived(eventId);
    }

    /// @notice View active joy events
    function getActiveEvents() external view returns (JoyEvent[] memory) {
        uint256 count;
        for (uint256 i = 0; i < eventCount; i++) {
            if (events[i].active) count++;
        }

        JoyEvent[] memory activeEvents = new JoyEvent[](count);
        uint256 index;
        for (uint256 i = 0; i < eventCount; i++) {
            if (events[i].active) {
                activeEvents[index] = events[i];
                index++;
            }
        }

        return activeEvents;
    }
}
