// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegislativeIntegrityDAO {
    address public validator;

    struct Bill {
        string title;
        string sponsor;
        string integrityTag;
        uint256 timestamp;
    }

    Bill[] public bills;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logBill(string memory _title, string memory _sponsor, string memory _tag) public onlyValidator {
        bills.push(Bill(_title, _sponsor, _tag, block.timestamp));
    }

    function getBill(uint256 index) public view returns (Bill memory) {
        return bills[index];
    }

    function totalBills() public view returns (uint256) {
        return bills.length;
    }
}
