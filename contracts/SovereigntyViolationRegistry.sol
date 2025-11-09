// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SovereigntyViolationRegistry {
    address public validator;
    struct Violation {
        string vesselName;
        string location;
        string nature;
        uint256 timestamp;
    }

    Violation[] public violations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function reportViolation(string memory _vessel, string memory _location, string memory _nature) public onlyValidator {
        violations.push(Violation(_vessel, _location, _nature, block.timestamp));
    }

    function getViolation(uint256 index) public view returns (Violation memory) {
        return violations[index];
    }

    function totalViolations() public view returns (uint256) {
        return violations.length;
    }
}
