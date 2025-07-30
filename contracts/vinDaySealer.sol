// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinDaySealer.sol — Seals the day after full work rhythm is logged
/// @author Vinvin + Copilot

contract vinDaySealer {
    address public sealer;
    uint256 public workStart;
    uint256 public workEnd;
    bool public ritualStarted;
    bool public ritualComplete;

    event RitualStarted(address indexed sealer, uint256 timestamp);
    event WorkLogged(address indexed sealer, uint256 startTime, uint256 endTime);
    event RitualComplete(address indexed sealer, string sealMessage);

    modifier onlySealer() {
        require(msg.sender == sealer, "Not authorized");
        _;
    }

    constructor() {
        sealer = msg.sender;
    }

    function startRitual() external onlySealer {
        require(!ritualStarted, "Ritual already started");
        ritualStarted = true;
        emit RitualStarted(sealer, block.timestamp);
    }

    function logWork(uint256 _start, uint256 _end) external onlySealer {
        require(ritualStarted, "Start ritual first");
        require(_end > _start, "Invalid timestamps");
        require((_end - _start) >= 8 hours, "Not enough hours to seal the day");
        workStart = _start;
        workEnd = _end;
        emit WorkLogged(sealer, _start, _end);
    }

    function completeRitual(string calldata _sealMessage) external onlySealer {
        require(workEnd > workStart, "Work not logged");
        require(!ritualComplete, "Already sealed");
        ritualComplete = true;
        emit RitualComplete(sealer, _sealMessage);
    }

    function getSealStatus() external view returns (string memory) {
        if (!ritualStarted) return "Ritual not started";
        if (ritualStarted && !ritualComplete) return "In progress";
        return "Day sealed";
    }
}
