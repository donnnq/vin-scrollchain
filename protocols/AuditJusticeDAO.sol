// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AuditJusticeDAO {
    address public validator;

    struct Audit {
        string agency;
        string project;
        string auditTag;
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

    function logAudit(string memory _agency, string memory _project, string memory _tag) public onlyValidator {
        audits.push(Audit(_agency, _project, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
