// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InformationAuthenticityDAO {
    address public validator;

    struct Record {
        string source;
        string claim;
        bool verified;
        string authenticityTag;
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

    function logRecord(string memory _source, string memory _claim, bool _verified, string memory _tag) public onlyValidator {
        records.push(Record(_source, _claim, _verified, _tag, block.timestamp));
    }

    function getRecord(uint256 index) public view returns (Record memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
