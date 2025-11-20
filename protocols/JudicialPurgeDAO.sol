// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JudicialPurgeDAO {
    address public validator;

    struct JudgeAudit {
        string name;
        string court;
        string auditTag;
        uint256 timestamp;
    }

    JudgeAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _name, string memory _court, string memory _tag) public onlyValidator {
        audits.push(JudgeAudit(_name, _court, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (JudgeAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
