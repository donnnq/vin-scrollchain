// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AuditTransparencyDAO {
    address public validator;

    struct AuditLog {
        string agency;
        string finding;
        string resonance;
        uint256 timestamp;
    }

    AuditLog[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _agency, string memory _finding, string memory _resonance) public onlyValidator {
        audits.push(AuditLog(_agency, _finding, _resonance, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (AuditLog memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
