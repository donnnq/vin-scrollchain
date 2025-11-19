// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MonetaryPolicyTimestampLedger {
    address public validator;

    struct Policy {
        string institution;
        string policyType;
        string impactZone;
        string policyTag;
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

    function logPolicy(string memory _institution, string memory _type, string memory _zone, string memory _tag) public onlyValidator {
        policies.push(Policy(_institution, _type, _zone, _tag, block.timestamp));
    }

    function getPolicy(uint256 index) public view returns (Policy memory) {
        return policies[index];
    }

    function totalPolicies() public view returns (uint256) {
        return policies.length;
    }
}
