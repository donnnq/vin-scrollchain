// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SignalInterceptionTimestampLedger {
    address public validator;

    struct Interception {
        string actor;
        string signalType;
        string location;
        string interceptionTag;
        uint256 timestamp;
    }

    Interception[] public interceptions;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logInterception(string memory _actor, string memory _signalType, string memory _location, string memory _tag) public onlyValidator {
        interceptions.push(Interception(_actor, _signalType, _location, _tag, block.timestamp));
    }

    function getInterception(uint256 index) public view returns (Interception memory) {
        return interceptions[index];
    }

    function totalInterceptions() public view returns (uint256) {
        return interceptions.length;
    }
}
