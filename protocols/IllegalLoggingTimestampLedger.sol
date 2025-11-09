// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IllegalLoggingTimestampLedger {
    address public validator;

    struct LoggingIncident {
        string location;
        string operator;
        string status;
        uint256 timestamp;
    }

    LoggingIncident[] public incidents;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logIncident(string memory _location, string memory _operator, string memory _status) public onlyValidator {
        incidents.push(LoggingIncident(_location, _operator, _status, block.timestamp));
    }

    function getIncident(uint256 index) public view returns (LoggingIncident memory) {
        return incidents[index];
    }

    function totalIncidents() public view returns (uint256) {
        return incidents.length;
    }
}
