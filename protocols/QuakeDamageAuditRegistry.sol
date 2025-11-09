// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract QuakeDamageAuditRegistry {
    address public validator;

    struct DamageReport {
        string location;
        string severity;
        string description;
        uint256 timestamp;
    }

    DamageReport[] public reports;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitReport(string memory _location, string memory _severity, string memory _description) public onlyValidator {
        reports.push(DamageReport(_location, _severity, _description, block.timestamp));
    }

    function getReport(uint256 index) public view returns (DamageReport memory) {
        return reports[index];
    }

    function totalReports() public view returns (uint256) {
        return reports.length;
    }
}
