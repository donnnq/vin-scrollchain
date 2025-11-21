// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TerrorDesignationTimestampLedger {
    address public validator;

    struct Designation {
        string entity;
        string reason;
        string resonance;
        uint256 timestamp;
    }

    Designation[] public designations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDesignation(string memory _entity, string memory _reason, string memory _resonance) public onlyValidator {
        designations.push(Designation(_entity, _reason, _resonance, block.timestamp));
    }

    function getDesignation(uint256 index) public view returns (Designation memory) {
        return designations[index];
    }

    function totalDesignations() public view returns (uint256) {
        return designations.length;
    }
}
