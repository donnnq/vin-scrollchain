// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AISecurityGovernanceDAO {
    address public validator;

    struct Audit {
        string system;
        string action;
        string securityTag;
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

    function logAudit(string memory _system, string memory _action, string memory _tag) public onlyValidator {
        audits.push(Audit(_system, _action, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
