// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PostQuakeLivelihoodRevivalDAO {
    address public validator;
    mapping(address => uint256) public grants;
    uint256 public totalFunded;

    event GrantIssued(address recipient, uint256 amount, string purpose, uint256 timestamp);

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function issueGrant(address _recipient, uint256 _amount, string memory _purpose) public onlyValidator {
        grants[_recipient] += _amount;
        totalFunded += _amount;
        emit GrantIssued(_recipient, _amount, _purpose, block.timestamp);
    }

    function getGrant(address _recipient) public view returns (uint256) {
        return grants[_recipient];
    }
}
