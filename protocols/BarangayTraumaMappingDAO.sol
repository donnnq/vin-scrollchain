// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayTraumaMappingDAO {
    address public validator;

    struct TraumaReport {
        string barangay;
        string trigger;
        string emotionalTag;
        uint256 timestamp;
    }

    TraumaReport[] public reports;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitReport(string memory _barangay, string memory _trigger, string memory _tag) public onlyValidator {
        reports.push(TraumaReport(_barangay, _trigger, _tag, block.timestamp));
    }

    function getReport(uint256 index) public view returns (TraumaReport memory) {
        return reports[index];
    }

    function totalReports() public view returns (uint256) {
        return reports.length;
    }
}
