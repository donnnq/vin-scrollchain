// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EnergyTransparencyDAO {
    address public validator;

    struct EnergyAudit {
        string source;
        string action;
        string auditTag;
        uint256 timestamp;
    }

    EnergyAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAudit(string memory _source, string memory _action, string memory _tag) public onlyValidator {
        audits.push(EnergyAudit(_source, _action, _tag, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (EnergyAudit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
