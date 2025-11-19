// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GovernmentSpendingTimestampLedger {
    address public validator;

    struct Flow {
        string project;
        string category;
        uint256 amount;
        string flowTag;
        uint256 timestamp;
    }

    Flow[] public flows;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFlow(string memory _project, string memory _category, uint256 _amount, string memory _tag) public onlyValidator {
        flows.push(Flow(_project, _category, _amount, _tag, block.timestamp));
    }

    function getFlow(uint256 index) public view returns (Flow memory) {
        return flows[index];
    }

    function totalFlows() public view returns (uint256) {
        return flows.length;
    }
}
