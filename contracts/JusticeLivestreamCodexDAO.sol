// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JusticeLivestreamCodexDAO {
    address public admin;

    struct LivestreamEvent {
        string caseName;
        string accusedEntity;
        string platform;
        string emotionalTag;
        bool archived;
    }

    LivestreamEvent[] public events;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleEvent(string memory _caseName, string memory _accusedEntity, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        events.push(LivestreamEvent(_caseName, _accusedEntity, _platform, _emotionalTag, false));
    }

    function archiveEvent(uint256 index) external onlyAdmin {
        events[index].archived = true;
    }

    function getEvent(uint256 index) external view returns (LivestreamEvent memory) {
        return events[index];
    }
}
