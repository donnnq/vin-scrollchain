// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollEventCalendar
/// @notice Schedule and track scroll-based events (holidays, alerts, lore drops)
contract ScrollEventCalendar {
    struct Event {
        string name;
        uint256 timestamp;
        string details;
    }

    Event[] public events;
    mapping(string => uint256[]) public eventsByName;

    event EventScheduled(uint256 indexed eventId, string name, uint256 timestamp);
    event EventDetailsUpdated(uint256 indexed eventId, string details);

    /// @notice Schedule a new event with optional details
    function scheduleEvent(
        string calldata name,
        uint256 timestamp,
        string calldata details
    ) external {
        events.push(Event(name, timestamp, details));
        uint256 id = events.length - 1;
        eventsByName[name].push(id);
        emit EventScheduled(id, name, timestamp);
    }

    /// @notice Update the details of an existing event
    function updateDetails(uint256 eventId, string calldata details) external {
        Event storage e = events[eventId];
        e.details = details;
        emit EventDetailsUpdated(eventId, details);
    }

    /// @notice Get total number of scheduled events
    function getEventsCount() external view returns (uint256) {
        return events.length;
    }

    /// @notice Retrieve event IDs by their name
    function getEventsByName(string calldata name)
        external
        view
        returns (uint256[] memory)
    {
        return eventsByName[name];
    }
}
