// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SilentResignationSignalAmplifier {
    address public validator;

    struct Signal {
        address employee;
        string behavior;
        string trigger;
        uint256 timestamp;
    }

    Signal[] public signals;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function amplifySignal(address _employee, string memory _behavior, string memory _trigger) public onlyValidator {
        signals.push(Signal(_employee, _behavior, _trigger, block.timestamp));
    }

    function getSignal(uint256 index) public view returns (Signal memory) {
        return signals[index];
    }

    function totalSignals() public view returns (uint256) {
        return signals.length;
    }
}
