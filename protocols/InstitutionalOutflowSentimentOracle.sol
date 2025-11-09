// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InstitutionalOutflowSentimentOracle {
    address public validator;

    struct Outflow {
        string asset;
        uint256 amount;
        string source;
        uint256 timestamp;
    }

    Outflow[] public outflows;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function recordOutflow(string memory _asset, uint256 _amount, string memory _source) public onlyValidator {
        outflows.push(Outflow(_asset, _amount, _source, block.timestamp));
    }

    function getOutflow(uint256 index) public view returns (Outflow memory) {
        return outflows[index];
    }

    function totalOutflows() public view returns (uint256) {
        return outflows.length;
    }
}
