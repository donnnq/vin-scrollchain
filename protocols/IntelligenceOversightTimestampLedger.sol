// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IntelligenceOversightTimestampLedger {
    address public validator;

    struct Oversight {
        string agency;
        string action;
        string consequence;
        uint256 timestamp;
    }

    Oversight[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logOversight(string memory _agency, string memory _action, string memory _consequence) public onlyValidator {
        records.push(Oversight(_agency, _action, _consequence, block.timestamp));
    }

    function getOversight(uint256 index) public view returns (Oversight memory) {
        return records[index];
    }

    function totalOversights() public view returns (uint256) {
        return records.length;
    }
}
