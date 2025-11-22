// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToPostSimulationRecoveryGrid {
    string public batchID = "1321.9.100";
    string public steward = "Vinvin";

    address public admin;

    struct Recovery {
        address validator;
        string action;
        uint256 timestamp;
        bool completed;
    }

    mapping(bytes32 => Recovery) public recoveryRegistry;

    event RecoveryInitiated(bytes32 indexed key, address indexed validator, string action);
    event RecoveryCompleted(bytes32 indexed key, address indexed validator);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function initiateRecovery(address validator, string memory action) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(validator, action, block.timestamp));
        recoveryRegistry[key] = Recovery(validator, action, block.timestamp, false);
        emit RecoveryInitiated(key, validator, action);
    }

    function completeRecovery(bytes32 key) public onlyAdmin {
        Recovery storage r = recoveryRegistry[key];
        r.completed = true;
        emit RecoveryCompleted(key, r.validator);
    }

    function getRecovery(bytes32 key) public view returns (address validator, string memory action, uint256 timestamp, bool completed) {
        Recovery memory r = recoveryRegistry[key];
        return (r.validator, r.action, r.timestamp, r.completed);
    }
}
