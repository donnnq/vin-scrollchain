// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TeacherDignityCompensationDAO {
    address public validator;

    struct Compensation {
        address teacher;
        uint256 baseSalary;
        uint256 dignityBonus;
        string tag;
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

    function logCompensation(address _teacher, uint256 _base, uint256 _bonus, string memory _tag) public onlyValidator {
        compensations.push(Compensation(_teacher, _base, _bonus, _tag, block.timestamp));
    }

    function getCompensation(uint256 index) public view returns (Compensation memory) {
        return compensations[index];
    }

    function totalCompensations() public view returns (uint256) {
        return compensations.length;
    }
}
