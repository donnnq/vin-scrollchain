// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDeadHandDetector {
    address public trustedNode;
    uint256 public epochTimeout = 72 hours;
    mapping(bytes32 => uint256) public lastSignalTime;
    mapping(bytes32 => bool) public deadHandFlagged;

    event SignalLogged(bytes32 ritualID, uint256 timestamp);
    event DeadHandDetected(bytes32 ritualID, string alertMessage);

    modifier onlyTrusted() {
        require(msg.sender == trustedNode, "Unauthorized ritual observer");
        _;
    }

    constructor(address _trustedNode) {
        trustedNode = _trustedNode;
    }

    function logSignal(bytes32 ritualID) public onlyTrusted {
        lastSignalTime[ritualID] = block.timestamp;
        emit SignalLogged(ritualID, block.timestamp);
    }

    function checkForDeadHand(bytes32 ritualID) public {
        uint256 lastSignal = lastSignalTime[ritualID];
        require(lastSignal > 0, "No ritual recorded");
        if (block.timestamp > lastSignal + epochTimeout && !deadHandFlagged[ritualID]) {
            deadHandFlagged[ritualID] = true;
            emit DeadHandDetected(ritualID, "Epoch signal stalled — possible dead hand condition");
        }
    }

    function getSignalAge(bytes32 ritualID) public view returns (uint256) {
        return block.timestamp - lastSignalTime[ritualID];
    }

    function isDeadHand(bytes32 ritualID) public view returns (bool) {
        return deadHandFlagged[ritualID];
    }

    function updateTrustedNode(address newNode) public onlyTrusted {
        trustedNode = newNode;
    }

    function setEpochTimeout(uint256 newTimeout) public onlyTrusted {
        epochTimeout = newTimeout;
    }
}
