// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TraumaRecoverySignalAmplifier {
    address public validator;

    struct RecoverySignal {
        string location;
        string activity;
        string emotionalTag;
        uint256 timestamp;
    }

    RecoverySignal[] public signals;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function amplifySignal(string memory _location, string memory _activity, string memory _tag) public onlyValidator {
        signals.push(RecoverySignal(_location, _activity, _tag, block.timestamp));
    }

    function getSignal(uint256 index) public view returns (RecoverySignal memory) {
        return signals[index];
    }

    function totalSignals() public view returns (uint256) {
        return signals.length;
    }
}
