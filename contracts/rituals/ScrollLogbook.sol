// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollLogbook {
    struct Log {
        address sender;
        uint256 timestamp;
        string message;
    }

    Log[] public logs;

    event LogWritten(address indexed sender, uint256 timestamp, string message);

    function writeLog(string calldata message) external {
        logs.push(Log(msg.sender, block.timestamp, message));
        emit LogWritten(msg.sender, block.timestamp, message);
    }

    function getLog(uint256 index) external view returns (Log memory) {
        return logs[index];
    }

    function totalLogs() external view returns (uint256) {
        return logs.length;
    }
}
