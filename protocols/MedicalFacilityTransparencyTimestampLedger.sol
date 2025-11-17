// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MedicalFacilityTransparencyTimestampLedger {
    address public validator;

    struct Progress {
        string facility;
        string phase;
        string transparencyTag;
        uint256 timestamp;
    }

    Progress[] public progressLogs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logProgress(string memory _facility, string memory _phase, string memory _tag) public onlyValidator {
        progressLogs.push(Progress(_facility, _phase, _tag, block.timestamp));
    }

    function getProgress(uint256 index) public view returns (Progress memory) {
        return progressLogs[index];
    }

    function totalProgressLogs() public view returns (uint256) {
        return progressLogs.length;
    }
}
