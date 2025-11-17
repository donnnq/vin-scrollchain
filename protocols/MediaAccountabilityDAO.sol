// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MediaAccountabilityDAO {
    address public validator;

    struct Violation {
        string outlet;
        string offense;
        string penalty;
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

    function logViolation(string memory _outlet, string memory _offense, string memory _penalty) public onlyValidator {
        violations.push(Violation(_outlet, _offense, _penalty, block.timestamp));
    }

    function getViolation(uint256 index) public view returns (Violation memory) {
        return violations[index];
    }

    function totalViolations() public view returns (uint256) {
        return violations.length;
    }
}
