// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BurnoutRecoveryBroadcastManifest {
    address public validator;

    struct Recovery {
        address employee;
        string ritual;
        string supportType;
        uint256 timestamp;
    }

    Recovery[] public recoveries;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastRecovery(address _employee, string memory _ritual, string memory _supportType) public onlyValidator {
        recoveries.push(Recovery(_employee, _ritual, _supportType, block.timestamp));
    }

    function getRecovery(uint256 index) public view returns (Recovery memory) {
        return recoveries[index];
    }

    function totalRecoveries() public view returns (uint256) {
        return recoveries.length;
    }
}
