// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureTransparencyTimestampLedger {
    address public validator;

    struct Record {
        string project;
        uint256 amount;
        string transparencyTag;
        uint256 timestamp;
    }

    Record[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRecord(string memory _project, uint256 _amount, string memory _tag) public onlyValidator {
        records.push(Record(_project, _amount, _tag, block.timestamp));
    }

    function getRecord(uint256 index) public view returns (Record memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
