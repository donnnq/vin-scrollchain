// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ValidatorGradeEnvironmentalImpactLedger {
    address public validator;

    struct Impact {
        string project;
        string metric;
        int256 value;
        string consequence;
        uint256 timestamp;
    }

    Impact[] public impacts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logImpact(string memory _project, string memory _metric, int256 _value, string memory _consequence) public onlyValidator {
        impacts.push(Impact(_project, _metric, _value, _consequence, block.timestamp));
    }

    function getImpact(uint256 index) public view returns (Impact memory) {
        return impacts[index];
    }

    function totalImpacts() public view returns (uint256) {
        return impacts.length;
    }
}
