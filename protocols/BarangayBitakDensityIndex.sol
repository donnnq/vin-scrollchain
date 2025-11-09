// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayBitakDensityIndex {
    address public validator;

    struct BitakReport {
        string barangay;
        uint8 densityScore; // 0–100
        string description;
        uint256 timestamp;
    }

    BitakReport[] public reports;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitReport(string memory _barangay, uint8 _score, string memory _description) public onlyValidator {
        require(_score <= 100, "Score must be 0–100");
        reports.push(BitakReport(_barangay, _score, _description, block.timestamp));
    }

    function getReport(uint256 index) public view returns (BitakReport memory) {
        return reports[index];
    }

    function totalReports() public view returns (uint256) {
        return reports.length;
    }
}
