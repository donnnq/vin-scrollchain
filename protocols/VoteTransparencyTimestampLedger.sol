// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VoteTransparencyTimestampLedger {
    address public validator;

    struct Record {
        string process;
        string detail;
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

    function logRecord(string memory _process, string memory _detail, string memory _tag) public onlyValidator {
        records.push(Record(_process, _detail, _tag, block.timestamp));
    }

    function getRecord(uint256 index) public view returns (Record memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
