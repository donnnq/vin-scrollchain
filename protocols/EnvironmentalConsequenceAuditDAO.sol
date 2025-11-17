// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EnvironmentalConsequenceAuditDAO {
    address public validator;

    struct Audit {
        string project;
        string impact;
        string severity;
        uint256 timestamp;
    }

    Audit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _project, string memory _impact, string memory _severity) public onlyValidator {
        audits.push(Audit(_project, _impact, _severity, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
