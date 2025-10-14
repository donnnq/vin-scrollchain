// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalIdentitySovereigntyDAO {
    address public admin;

    struct IdentityClaim {
        string individualID;
        string sovereigntyTag;
        string platformOrigin;
        bool verified;
    }

    IdentityClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _individualID, string memory _sovereigntyTag, string memory _platformOrigin) external onlyAdmin {
        claims.push(IdentityClaim(_individualID, _sovereigntyTag, _platformOrigin, false));
    }

    function verifyClaim(uint256 index) external onlyAdmin {
        claims[index].verified = true;
    }

    function getClaim(uint256 index) external view returns (IdentityClaim memory) {
        return claims[index];
    }
}
