// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ToxicLeadershipAuditDAO {
    address public validator;

    struct Audit {
        address leader;
        string behavior;
        string impact;
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

    function logAudit(address _leader, string memory _behavior, string memory _impact) public onlyValidator {
        audits.push(Audit(_leader, _behavior, _impact, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
