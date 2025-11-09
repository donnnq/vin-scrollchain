// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmergencyShelterDisbursementDAO {
    address public validator;
    mapping(address => uint256) public aidReceived;
    uint256 public totalDisbursed;

    event AidDisbursed(address recipient, uint256 amount, uint256 timestamp);

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function disburseAid(address _recipient, uint256 _amount) public onlyValidator {
        aidReceived[_recipient] += _amount;
        totalDisbursed += _amount;
        emit AidDisbursed(_recipient, _amount, block.timestamp);
    }

    function getAid(address _recipient) public view returns (uint256) {
        return aidReceived[_recipient];
    }
}
