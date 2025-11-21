// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CodeManagementTimestampLedger {
    address public validator;

    struct CodeEvent {
        string module;
        string change;
        string auditor;
        uint256 timestamp;
    }

    CodeEvent[] public events;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logEvent(string memory _module, string memory _change, string memory _auditor) public onlyValidator {
        events.push(CodeEvent(_module, _change, _auditor, block.timestamp));
    }

    function getEvent(uint256 index) public view returns (CodeEvent memory) {
        return events[index];
    }

    function totalEvents() public view returns (uint256) {
        return events.length;
    }
}
