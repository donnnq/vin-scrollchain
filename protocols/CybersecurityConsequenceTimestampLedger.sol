// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CybersecurityConsequenceTimestampLedger {
    address public validator;

    struct Event {
        string vulnerability;
        string impact;
        string consequence;
        uint256 timestamp;
    }

    Event[] public events;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logEvent(string memory _vulnerability, string memory _impact, string memory _consequence) public onlyValidator {
        events.push(Event(_vulnerability, _impact, _consequence, block.timestamp));
    }

    function getEvent(uint256 index) public view returns (Event memory) {
        return events[index];
    }

    function totalEvents() public view returns (uint256) {
        return events.length;
    }
}
