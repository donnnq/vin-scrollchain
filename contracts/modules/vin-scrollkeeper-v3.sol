// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollKeeperV3 {
    enum EventType { Pulse, Ritual, Invocation, ScrollInteraction }

    struct ScrollEvent {
        EventType eventType;
        string description;
        address triggeredBy;
        uint256 timestamp;
    }

    ScrollEvent[] public events;
    address public immutable keeper;

    event ScrollLogged(EventType eventType, string description, address indexed by, uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Not the keeper");
        _;
    }

    constructor() {
        keeper = msg.sender;
    }

    function logEvent(EventType eventType, string calldata description) external onlyKeeper {
        events.push(ScrollEvent({
            eventType: eventType,
            description: description,
            triggeredBy: msg.sender,
            timestamp: block.timestamp
        }));

        emit ScrollLogged(eventType, description, msg.sender, events.length - 1, block.timestamp);
    }

    function getEvent(uint256 id) external view returns (ScrollEvent memory) {
        require(id < events.length, "Invalid event ID");
        return events[id];
    }

    function totalEvents() external view returns (uint256) {
        return events.length;
    }
}
