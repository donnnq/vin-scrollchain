// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MonetarySecurityDAO {
    address public validator;

    struct SecurityLog {
        string institution;
        string action;
        string asset;
        string securityTag;
        uint256 timestamp;
    }

    SecurityLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logSecurity(string memory _institution, string memory _action, string memory _asset, string memory _tag) public onlyValidator {
        logs.push(SecurityLog(_institution, _action, _asset, _tag, block.timestamp));
    }

    function getSecurity(uint256 index) public view returns (SecurityLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
