// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NetworkBreachTimestampLedger {
    address public validator;

    struct Breach {
        string system;
        string vector;
        string breachTag;
        uint256 timestamp;
    }

    Breach[] public breaches;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logBreach(string memory _system, string memory _vector, string memory _tag) public onlyValidator {
        breaches.push(Breach(_system, _vector, _tag, block.timestamp));
    }

    function getBreach(uint256 index) public view returns (Breach memory) {
        return breaches[index];
    }

    function totalBreaches() public view returns (uint256) {
        return breaches.length;
    }
}
