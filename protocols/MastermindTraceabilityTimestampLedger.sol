// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MastermindTraceabilityTimestampLedger {
    address public validator;

    struct Trace {
        string actor;
        string network;
        string exposureTag;
        uint256 timestamp;
    }

    Trace[] public traces;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logTrace(string memory _actor, string memory _network, string memory _tag) public onlyValidator {
        traces.push(Trace(_actor, _network, _tag, block.timestamp));
    }

    function getTrace(uint256 index) public view returns (Trace memory) {
        return traces[index];
    }

    function totalTraces() public view returns (uint256) {
        return traces.length;
    }
}
