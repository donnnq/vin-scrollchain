// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ThreatIntelligenceTimestampLedger {
    address public validator;

    struct Threat {
        string source;
        string type;
        string threatTag;
        uint256 timestamp;
    }

    Threat[] public threats;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logThreat(string memory _source, string memory _type, string memory _tag) public onlyValidator {
        threats.push(Threat(_source, _type, _tag, block.timestamp));
    }

    function getThreat(uint256 index) public view returns (Threat memory) {
        return threats[index];
    }

    function totalThreats() public view returns (uint256) {
        return threats.length;
    }
}
