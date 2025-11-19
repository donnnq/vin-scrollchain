// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WasteAuditDAO {
    address public validator;

    struct WasteLog {
        string location;
        string action;
        string wasteTag;
        uint256 timestamp;
    }

    WasteLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logWaste(string memory _location, string memory _action, string memory _tag) public onlyValidator {
        logs.push(WasteLog(_location, _action, _tag, block.timestamp));
    }

    function getWaste(uint256 index) public view returns (WasteLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
