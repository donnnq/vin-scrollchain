// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TerritorialClaimProof {
    address public validator;

    struct Claim {
        string region;
        string basis;
        string emotionalTag;
        uint256 timestamp;
    }

    Claim[] public claims;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function registerClaim(string memory _region, string memory _basis, string memory _tag) public onlyValidator {
        claims.push(Claim(_region, _basis, _tag, block.timestamp));
    }

    function getClaim(uint256 index) public view returns (Claim memory) {
        return claims[index];
    }

    function totalClaims() public view returns (uint256) {
        return claims.length;
    }
}
