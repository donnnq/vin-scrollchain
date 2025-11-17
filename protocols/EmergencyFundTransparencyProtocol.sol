// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmergencyFundTransparencyProtocol {
    address public validator;

    struct Fund {
        string project;
        uint256 amount;
        string transparencyTag;
        uint256 timestamp;
    }

    Fund[] public funds;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFund(string memory _project, uint256 _amount, string memory _tag) public onlyValidator {
        funds.push(Fund(_project, _amount, _tag, block.timestamp));
    }

    function getFund(uint256 index) public view returns (Fund memory) {
        return funds[index];
    }

    function totalFunds() public view returns (uint256) {
        return funds.length;
    }
}
