// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalTaggingOfAidDisbursementManifest {
    address public validator;

    struct Disbursement {
        address recipient;
        uint256 amount;
        string tag;
        string urgency;
        uint256 timestamp;
    }

    Disbursement[] public disbursements;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function tagDisbursement(address _recipient, uint256 _amount, string memory _tag, string memory _urgency) public onlyValidator {
        disbursements.push(Disbursement(_recipient, _amount, _tag, _urgency, block.timestamp));
    }

    function getDisbursement(uint256 index) public view returns (Disbursement memory) {
        return disbursements[index];
    }

    function totalDisbursements() public view returns (uint256) {
        return disbursements.length;
    }
}
