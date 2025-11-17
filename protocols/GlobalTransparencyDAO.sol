// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalTransparencyDAO {
    address public validator;

    struct Transparency {
        string sector;
        string country;
        string auditTag;
        uint256 timestamp;
    }

    Transparency[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logTransparency(string memory _sector, string memory _country, string memory _tag) public onlyValidator {
        records.push(Transparency(_sector, _country, _tag, block.timestamp));
    }

    function getTransparency(uint256 index) public view returns (Transparency memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
