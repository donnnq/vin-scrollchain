// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AIIntegrityTimestampLedger {
    address public validator;

    struct Integrity {
        string system;
        string check;
        string integrityTag;
        uint256 timestamp;
    }

    Integrity[] public checks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCheck(string memory _system, string memory _check, string memory _tag) public onlyValidator {
        checks.push(Integrity(_system, _check, _tag, block.timestamp));
    }

    function getCheck(uint256 index) public view returns (Integrity memory) {
        return checks[index];
    }

    function totalChecks() public view returns (uint256) {
        return checks.length;
    }
}
