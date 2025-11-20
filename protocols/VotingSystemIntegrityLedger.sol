// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VotingSystemIntegrityLedger {
    address public validator;

    struct VotingAudit {
        string system;
        string upgrade;
        string integrityTag;
        uint256 timestamp;
    }

    VotingAudit[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logUpgrade(string memory _system, string memory _upgrade, string memory _tag) public onlyValidator {
        audits.push(VotingAudit(_system, _upgrade, _tag, block.timestamp));
    }

    function getUpgrade(uint256 index) public view returns (VotingAudit memory) {
        return audits[index];
    }

    function totalUpgrades() public view returns (uint256) {
        return audits.length;
    }
}
