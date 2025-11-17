// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegalTransparencyTimestampLedger {
    address public validator;

    struct LegalEvent {
        string caseName;
        string stage;
        string transparencyTag;
        uint256 timestamp;
    }

    LegalEvent[] public events;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logEvent(string memory _caseName, string memory _stage, string memory _tag) public onlyValidator {
        events.push(LegalEvent(_caseName, _stage, _tag, block.timestamp));
    }

    function getEvent(uint256 index) public view returns (LegalEvent memory) {
        return events[index];
    }

    function totalEvents() public view returns (uint256) {
        return events.length;
    }
}
