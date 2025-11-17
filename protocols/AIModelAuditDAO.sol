// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AIModelAuditDAO {
    address public validator;

    struct Audit {
        string modelName;
        uint256 hallucinationRate;
        uint256 coherenceScore;
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

    function logAudit(string memory _model, uint256 _hallucinationRate, uint256 _coherenceScore, string memory _tag) public onlyValidator {
        audits.push(Audit(_model, _hallucinationRate, _coherenceScore, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
