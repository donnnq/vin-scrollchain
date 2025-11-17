// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProductAuthenticityTimestampLedger {
    address public validator;

    struct Check {
        string product;
        string origin;
        bool authentic;
        string authenticityTag;
        uint256 timestamp;
    }

    Check[] public checks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCheck(string memory _product, string memory _origin, bool _authentic, string memory _tag) public onlyValidator {
        checks.push(Check(_product, _origin, _authentic, _tag, block.timestamp));
    }

    function getCheck(uint256 index) public view returns (Check memory) {
        return checks[index];
    }

    function totalChecks() public view returns (uint256) {
        return checks.length;
    }
}
