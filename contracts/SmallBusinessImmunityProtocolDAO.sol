// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmallBusinessImmunityProtocolDAO {
    address public admin;

    struct ImmunityClaim {
        string businessName;
        string city;
        string policyThreat;
        bool protected;
    }

    ImmunityClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileClaim(string memory _businessName, string memory _city, string memory _policyThreat) external onlyAdmin {
        claims.push(ImmunityClaim(_businessName, _city, _policyThreat, false));
    }

    function grantProtection(uint256 index) external onlyAdmin {
        claims[index].protected = true;
    }

    function getClaim(uint256 index) external view returns (ImmunityClaim memory) {
        return claims[index];
    }
}
