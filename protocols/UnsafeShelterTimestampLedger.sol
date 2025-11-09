// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UnsafeShelterTimestampLedger {
    address public validator;

    struct Shelter {
        string addressDetail;
        string barangay;
        string status;
        uint256 timestamp;
    }

    Shelter[] public shelters;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logShelter(string memory _addressDetail, string memory _barangay, string memory _status) public onlyValidator {
        shelters.push(Shelter(_addressDetail, _barangay, _status, block.timestamp));
    }

    function getShelter(uint256 index) public view returns (Shelter memory) {
        return shelters[index];
    }

    function totalShelters() public view returns (uint256) {
        return shelters.length;
    }
}
