// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AgencyReductionDAO {
    address public validator;

    struct AgencyAudit {
        string agency;
        string action;
        string auditTag;
        uint256 timestamp;
    }

    AgencyAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAgency(string memory _agency, string memory _action, string memory _tag) public onlyValidator {
        audits.push(AgencyAudit(_agency, _action, _tag, block.timestamp));
    }

    function getAgency(uint256 index) public view returns (AgencyAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
