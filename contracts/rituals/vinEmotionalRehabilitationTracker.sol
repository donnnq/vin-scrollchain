// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinEmotionalRehabilitationTracker {
    address public scrollkeeper;

    struct RecoveryLog {
        string name;
        string phase;
        string reflection;
        uint256 timestamp;
    }

    RecoveryLog[] public logs;

    event RecoveryLogged(string name, string phase);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logRecovery(string memory name, string memory phase, string memory reflection) external onlyScrollkeeper {
        logs.push(RecoveryLog(name, phase, reflection, block.timestamp));
        emit RecoveryLogged(name, phase);
    }

    function getLog(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        RecoveryLog memory r = logs[index];
        return (r.name, r.phase, r.reflection, r.timestamp);
    }

    function totalRecoveryLogs() external view returns (uint256) {
        return logs.length;
    }
}
