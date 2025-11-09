// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DisinformationAuditDAO {
    address public validator;

    struct Claim {
        string source;
        string claimText;
        bool verifiedFalse;
        string emotionalTrigger;
        uint256 timestamp;
    }

    Claim[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logClaim(string memory _source, string memory _claimText, bool _verifiedFalse, string memory _trigger) public onlyValidator {
        audits.push(Claim(_source, _claimText, _verifiedFalse, _trigger, block.timestamp));
    }

    function getClaim(uint256 index) public view returns (Claim memory) {
        return audits[index];
    }

    function totalClaims() public view returns (uint256) {
        return audits.length;
    }
}
