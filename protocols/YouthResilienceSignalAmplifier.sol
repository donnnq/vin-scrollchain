// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract YouthResilienceSignalAmplifier {
    address public validator;

    struct Signal {
        string name;
        string act;
        string resonance;
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

    function amplifySignal(string memory _name, string memory _act, string memory _resonance) public onlyValidator {
        signals.push(Signal(_name, _act, _resonance, block.timestamp));
    }

    function getSignal(uint256 index) public view returns (Signal memory) {
        return signals[index];
    }

    function totalSignals() public view returns (uint256) {
        return signals.length;
    }
}
