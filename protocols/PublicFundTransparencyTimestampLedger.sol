// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicFundTransparencyTimestampLedger {
    address public validator;

    struct FundFlow {
        string project;
        uint256 amount;
        string transparencyTag;
        uint256 timestamp;
    }

    FundFlow[] public fundFlows;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFundFlow(string memory _project, uint256 _amount, string memory _tag) public onlyValidator {
        fundFlows.push(FundFlow(_project, _amount, _tag, block.timestamp));
    }

    function getFundFlow(uint256 index) public view returns (FundFlow memory) {
        return fundFlows[index];
    }

    function totalFundFlows() public view returns (uint256) {
        return fundFlows.length;
    }
}
