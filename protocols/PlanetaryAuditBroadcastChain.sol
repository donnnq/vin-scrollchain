// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PlanetaryAuditBroadcastChain {
    address public validator;

    struct Audit {
        string domain;
        string finding;
        string resonance;
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

    function broadcastAudit(string memory _domain, string memory _finding, string memory _resonance) public onlyValidator {
        audits.push(Audit(_domain, _finding, _resonance, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Audit memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
