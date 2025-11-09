// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayMercyAllocationLedger {
    address public validator;

    struct MercyDrop {
        string barangay;
        uint256 amount;
        string tag;
        uint256 timestamp;
    }

    MercyDrop[] public drops;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDrop(string memory _barangay, uint256 _amount, string memory _tag) public onlyValidator {
        drops.push(MercyDrop(_barangay, _amount, _tag, block.timestamp));
    }

    function getDrop(uint256 index) public view returns (MercyDrop memory) {
        return drops[index];
    }

    function totalDrops() public view returns (uint256) {
        return drops.length;
    }
}
