// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LocalGovernmentResponseTimestampLedger {
    address public validator;

    struct Response {
        string lgu;
        string action;
        string status;
        uint256 timestamp;
    }

    Response[] public responses;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logResponse(string memory _lgu, string memory _action, string memory _status) public onlyValidator {
        responses.push(Response(_lgu, _action, _status, block.timestamp));
    }

    function getResponse(uint256 index) public view returns (Response memory) {
        return responses[index];
    }

    function totalResponses() public view returns (uint256) {
        return responses.length;
    }
}
