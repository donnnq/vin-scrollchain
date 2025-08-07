// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinJusticeDelayTracker {
    struct DelayRecord {
        uint256 startTime;
        uint256 endTime;
        bool completed;
    }

    mapping(address => DelayRecord) public delays;

    function startDelay(address _victim) public {
        delays[_victim] = DelayRecord(block.timestamp, 0, false);
    }

    function endDelay(address _victim) public {
        require(!delays[_victim].completed, "Already completed");
        delays[_victim].endTime = block.timestamp;
        delays[_victim].completed = true;
    }

    function getDelayDuration(address _victim) public view returns (uint256) {
        DelayRecord memory record = delays[_victim];
        require(record.completed, "Delay not completed");
        return record.endTime - record.startTime;
    }
}
