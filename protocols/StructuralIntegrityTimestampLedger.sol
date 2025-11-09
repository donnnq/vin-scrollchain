// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StructuralIntegrityTimestampLedger {
    address public validator;

    struct IntegrityCheck {
        string location;
        string status;
        string inspector;
        uint256 timestamp;
    }

    IntegrityCheck[] public checks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCheck(string memory _location, string memory _status, string memory _inspector) public onlyValidator {
        checks.push(IntegrityCheck(_location, _status, _inspector, block.timestamp));
    }

    function getCheck(uint256 index) public view returns (IntegrityCheck memory) {
        return checks[index];
    }

    function totalChecks() public view returns (uint256) {
        return checks.length;
    }
}
