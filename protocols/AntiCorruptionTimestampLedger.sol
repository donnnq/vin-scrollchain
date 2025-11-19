// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AntiCorruptionTimestampLedger {
    address public validator;

    struct Action {
        string caseName;
        string status;
        string integrityTag;
        uint256 timestamp;
    }

    Action[] public actions;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAction(string memory _case, string memory _status, string memory _tag) public onlyValidator {
        actions.push(Action(_case, _status, _tag, block.timestamp));
    }

    function getAction(uint256 index) public view returns (Action memory) {
        return actions[index];
    }

    function totalActions() public view returns (uint256) {
        return actions.length;
    }
}
