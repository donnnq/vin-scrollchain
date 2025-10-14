// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthImmunityDAO {
    address public admin;

    struct ImmunityClaim {
        string whistleblower;
        string caseReference;
        string truthStatement;
        bool granted;
    }

    ImmunityClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileClaim(string memory _whistleblower, string memory _caseReference, string memory _truthStatement) external onlyAdmin {
        claims.push(ImmunityClaim(_whistleblower, _caseReference, _truthStatement, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        claims[index].granted = true;
    }

    function getClaim(uint256 index) external view returns (ImmunityClaim memory) {
        return claims[index];
    }
}
