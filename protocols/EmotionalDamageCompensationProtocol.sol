// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalDamageCompensationProtocol {
    address public validator;

    struct Compensation {
        address recipient;
        string damageType;
        string source;
        uint256 amount;
        uint256 timestamp;
    }

    Compensation[] public compensations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function compensate(address _recipient, string memory _damageType, string memory _source, uint256 _amount) public onlyValidator {
        compensations.push(Compensation(_recipient, _damageType, _source, _amount, block.timestamp));
    }

    function getCompensation(uint256 index) public view returns (Compensation memory) {
        return compensations[index];
    }

    function totalCompensations() public view returns (uint256) {
        return compensations.length;
    }
}
