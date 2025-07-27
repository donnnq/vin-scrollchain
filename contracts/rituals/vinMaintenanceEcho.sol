// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinMaintenanceEcho {
    address public oracle;
    uint256 public echoIndex;

    struct EchoLog {
        uint256 timestamp;
        string concern;
        string status;
    }

    mapping(uint256 => EchoLog) public logs;

    event EchoRegistered(uint256 indexed logId, string concern, string status);

    constructor() {
        oracle = msg.sender;
        echoIndex = 0;
    }

    function registerEcho(string memory _concern, string memory _status) public {
        logs[echoIndex] = EchoLog(block.timestamp, _concern, _status);
        emit EchoRegistered(echoIndex, _concern, _status);
        echoIndex += 1;
    }

    function getEchoLog(uint256 _logId) public view returns (uint256, string memory, string memory) {
        EchoLog memory log = logs[_logId];
        return (log.timestamp, log.concern, log.status);
    }
}
