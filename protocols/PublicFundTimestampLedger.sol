// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicFundTimestampLedger {
    address public validator;

    struct FundEvent {
        string project;
        string allocation;
        string resonance;
        uint256 timestamp;
    }

    FundEvent[] public events;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFundEvent(string memory _project, string memory _allocation, string memory _resonance) public onlyValidator {
        events.push(FundEvent(_project, _allocation, _resonance, block.timestamp));
    }

    function getFundEvent(uint256 index) public view returns (FundEvent memory) {
        return events[index];
    }

    function totalEvents() public view returns (uint256) {
        return events.length;
    }
}
