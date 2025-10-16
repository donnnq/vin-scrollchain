// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MastermindArrestBroadcastPack {
    address public admin;

    struct ArrestEvent {
        string suspectName;
        string arrestLocation;
        string emotionalTag;
        bool broadcasted;
    }

    ArrestEvent[] public events;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEvent(string memory suspectName, string memory arrestLocation, string memory emotionalTag) external onlyAdmin {
        events.push(ArrestEvent(suspectName, arrestLocation, emotionalTag, false));
    }

    function broadcastEvent(uint256 index) external onlyAdmin {
        events[index].broadcasted = true;
    }

    function getEvent(uint256 index) external view returns (ArrestEvent memory) {
        return events[index];
    }
}
