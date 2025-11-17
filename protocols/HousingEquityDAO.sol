// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HousingEquityDAO {
    address public validator;

    struct Allocation {
        string beneficiary;
        string shelterType;
        uint256 units;
        string dignityTag;
        uint256 timestamp;
    }

    Allocation[] public allocations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAllocation(string memory _beneficiary, string memory _shelterType, uint256 _units, string memory _tag) public onlyValidator {
        allocations.push(Allocation(_beneficiary, _shelterType, _units, _tag, block.timestamp));
    }

    function getAllocation(uint256 index) public view returns (Allocation memory) {
        return allocations[index];
    }

    function totalAllocations() public view returns (uint256) {
        return allocations.length;
    }
}
