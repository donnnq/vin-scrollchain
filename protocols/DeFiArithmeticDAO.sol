// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeFiArithmeticDAO {
    address public validator;

    struct MathAudit {
        string pool;
        string issue;
        string tag;
        uint256 timestamp;
    }

    MathAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _pool, string memory _issue, string memory _tag) public onlyValidator {
        audits.push(MathAudit(_pool, _issue, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (MathAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
