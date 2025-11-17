// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DisasterReliefEquityDAO {
    address public validator;

    struct Relief {
        address recipient;
        uint256 amount;
        string aidType;
        string dignityTag;
        uint256 timestamp;
    }

    Relief[] public reliefs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function distributeRelief(address _recipient, uint256 _amount, string memory _aidType, string memory _tag) public onlyValidator {
        reliefs.push(Relief(_recipient, _amount, _aidType, _tag, block.timestamp));
    }

    function getRelief(uint256 index) public view returns (Relief memory) {
        return reliefs[index];
    }

    function totalReliefs() public view returns (uint256) {
        return reliefs.length;
    }
}
