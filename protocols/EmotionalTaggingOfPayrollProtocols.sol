// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalTaggingOfPayrollProtocols {
    address public validator;

    struct PayrollTag {
        address employee;
        uint256 amount;
        string emotionalTag;
        string reason;
        uint256 timestamp;
    }

    PayrollTag[] public tags;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function tagPayroll(address _employee, uint256 _amount, string memory _emotionalTag, string memory _reason) public onlyValidator {
        tags.push(PayrollTag(_employee, _amount, _emotionalTag, _reason, block.timestamp));
    }

    function getTag(uint256 index) public view returns (PayrollTag memory) {
        return tags[index];
    }

    function totalTags() public view returns (uint256) {
        return tags.length;
    }
}
