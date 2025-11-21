// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract KillSwitchTimestampLedger {
    address public validator;

    event KillSwitchArmed(string agent, string reason, uint256 timestamp);
    event KillSwitchTriggered(string agent, string effect, uint256 timestamp);
    event KillSwitchReleased(string agent, uint256 timestamp);

    struct KillRecord {
        string agent;
        string reason;
        string effect;
        uint256 timestamp;
        bool triggered;
    }

    KillRecord[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function arm(string memory agent, string memory reason) external onlyValidator {
        records.push(KillRecord(agent, reason, "", block.timestamp, false));
        emit KillSwitchArmed(agent, reason, block.timestamp);
    }

    function trigger(uint256 index, string memory effect) external onlyValidator {
        require(index < records.length, "Invalid index");
        records[index].effect = effect;
        records[index].triggered = true;
        emit KillSwitchTriggered(records[index].agent, effect, block.timestamp);
    }

    function release(uint256 index) external onlyValidator {
        require(index < records.length, "Invalid index");
        emit KillSwitchReleased(records[index].agent, block.timestamp);
    }

    function totalRecords() external view returns (uint256) {
        return records.length;
    }

    function getRecord(uint256 index) external view returns (KillRecord memory) {
        return records[index];
    }
}
