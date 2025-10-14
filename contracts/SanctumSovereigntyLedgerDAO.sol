// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumSovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyClaim {
        string sanctumType;
        string location;
        string sovereigntyTag;
        string emotionalTag;
        bool validated;
    }

    SovereigntyClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _sanctumType, string memory _location, string memory _sovereigntyTag, string memory _emotionalTag) external onlyAdmin {
        claims.push(SovereigntyClaim(_sanctumType, _location, _sovereigntyTag, _emotionalTag, false));
    }

    function validateClaim(uint256 index) external onlyAdmin {
        claims[index].validated = true;
    }

    function getClaim(uint256 index) external view returns (SovereigntyClaim memory) {
        return claims[index];
    }
}
