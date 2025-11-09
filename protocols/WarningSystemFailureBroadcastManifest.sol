// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WarningSystemFailureBroadcastManifest {
    address public validator;

    struct Failure {
        string system;
        string location;
        string impact;
        uint256 timestamp;
    }

    Failure[] public failures;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastFailure(string memory _system, string memory _location, string memory _impact) public onlyValidator {
        failures.push(Failure(_system, _location, _impact, block.timestamp));
    }

    function getFailure(uint256 index) public view returns (Failure memory) {
        return failures[index];
    }

    function totalFailures() public view returns (uint256) {
        return failures.length;
    }
}
