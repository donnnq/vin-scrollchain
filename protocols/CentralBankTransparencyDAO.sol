// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CentralBankTransparencyDAO {
    address public validator;

    struct Operation {
        string institution;
        string action;
        string asset;
        string transparencyTag;
        uint256 timestamp;
    }

    Operation[] public operations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logOperation(string memory _institution, string memory _action, string memory _asset, string memory _tag) public onlyValidator {
        operations.push(Operation(_institution, _action, _asset, _tag, block.timestamp));
    }

    function getOperation(uint256 index) public view returns (Operation memory) {
        return operations[index];
    }

    function totalOperations() public view returns (uint256) {
        return operations.length;
    }
}
