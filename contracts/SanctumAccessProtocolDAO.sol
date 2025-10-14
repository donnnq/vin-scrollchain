// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumAccessProtocolDAO {
    address public admin;

    struct AccessClaim {
        string userID;
        string sanctumType;
        string accessLevel;
        string emotionalTag;
        bool granted;
    }

    AccessClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _userID, string memory _sanctumType, string memory _accessLevel, string memory _emotionalTag) external onlyAdmin {
        claims.push(AccessClaim(_userID, _sanctumType, _accessLevel, _emotionalTag, false));
    }

    function grantAccess(uint256 index) external onlyAdmin {
        claims[index].granted = true;
    }

    function getClaim(uint256 index) external view returns (AccessClaim memory) {
        return claims[index];
    }
}
