// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract YouthDisplacementTimestampIndex {
    address public validator;

    struct Displacement {
        string name;
        string barangay;
        string reason;
        uint256 timestamp;
    }

    Displacement[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDisplacement(string memory _name, string memory _barangay, string memory _reason) public onlyValidator {
        records.push(Displacement(_name, _barangay, _reason, block.timestamp));
    }

    function getDisplacement(uint256 index) public view returns (Displacement memory) {
        return records[index];
    }

    function totalDisplacements() public view returns (uint256) {
        return records.length;
    }
}
