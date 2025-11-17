// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PolicyTransparencyTimestampLedger {
    address public validator;

    struct Policy {
        string name;
        string description;
        string transparencyTag;
        uint256 timestamp;
    }

    Policy[] public policies;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logPolicy(string memory _name, string memory _description, string memory _tag) public onlyValidator {
        policies.push(Policy(_name, _description, _tag, block.timestamp));
    }

    function getPolicy(uint256 index) public view returns (Policy memory) {
        return policies[index];
    }

    function totalPolicies() public view returns (uint256) {
        return policies.length;
    }
}
