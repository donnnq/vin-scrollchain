// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InformationAuthenticityDAO {
    address public validator;

    struct InfoLog {
        string source;
        string claim;
        string authenticityTag;
        uint256 timestamp;
    }

    InfoLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logInfo(string memory _source, string memory _claim, string memory _tag) public onlyValidator {
        logs.push(InfoLog(_source, _claim, _tag, block.timestamp));
    }

    function getInfo(uint256 index) public view returns (InfoLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
