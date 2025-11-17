// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract QueryTimeoutTimestampLedger {
    address public validator;

    struct Timeout {
        string aiModel;
        string query;
        uint256 allowedTime;
        uint256 actualTime;
        string timeoutTag;
        uint256 timestamp;
    }

    Timeout[] public timeouts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logTimeout(string memory _model, string memory _query, uint256 _allowed, uint256 _actual, string memory _tag) public onlyValidator {
        timeouts.push(Timeout(_model, _query, _allowed, _actual, _tag, block.timestamp));
    }

    function getTimeout(uint256 index) public view returns (Timeout memory) {
        return timeouts[index];
    }

    function totalTimeouts() public view returns (uint256) {
        return timeouts.length;
    }
}
