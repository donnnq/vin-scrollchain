// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinRestitutionAuditTrail {
    struct RecoveryLog {
        address victim;
        uint256 amount;
        bool success;
        uint256 timestamp;
    }

    RecoveryLog[] public logs;

    event RecoveryLogged(address indexed victim, uint256 amount, bool success, uint256 timestamp);

    function logRecovery(address _victim, uint256 _amount, bool _success) public {
        logs.push(RecoveryLog(_victim, _amount, _success, block.timestamp));
        emit RecoveryLogged(_victim, _amount, _success, block.timestamp);
    }

    function getLogCount() public view returns (uint256) {
        return logs.length;
    }

    function getLog(uint256 index) public view returns (RecoveryLog memory) {
        require(index < logs.length, "Invalid index");
        return logs[index];
    }
}
