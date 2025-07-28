// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinShadowReclaimer {
    address public reclaimer;
    uint256 public protocolStarted;

    struct ReclamationLog {
        address defiantEntity;
        string failedTreaty;
        uint256 timestamp;
        bool resourcesConfiscated;
    }

    ReclamationLog[] public logbook;

    event EntityTagged(address defiantEntity, string failedTreaty);
    event ResourcesConfiscated(address defiantEntity);

    modifier onlyReclaimer() {
        require(msg.sender == reclaimer, "Unauthorized scroll carrier.");
        _;
    }

    constructor() {
        reclaimer = msg.sender;
        protocolStarted = block.number;
    }

    function tagDefiant(address entity, string memory failedTreaty) external onlyReclaimer {
        logbook.push(ReclamationLog(entity, failedTreaty, block.timestamp, false));
        emit EntityTagged(entity, failedTreaty);
    }

    function confiscate(uint256 index) external onlyReclaimer {
        require(index < logbook.length, "No such entry.");
        require(!logbook[index].resourcesConfiscated, "Already confiscated.");
        logbook[index].resourcesConfiscated = true;
        emit ResourcesConfiscated(logbook[index].defiantEntity);
    }

    function lastReclaimed() external view returns (ReclamationLog memory) {
        require(logbook.length > 0, "No reclamations yet.");
        return logbook[logbook.length - 1];
    }
}
