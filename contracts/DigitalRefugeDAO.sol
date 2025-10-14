// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalRefugeDAO {
    address public admin;

    struct RefugeClaim {
        string userID;
        string platformOrigin;
        string sanctuaryType;
        string emotionalTag;
        bool granted;
    }

    RefugeClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _userID, string memory _platformOrigin, string memory _sanctuaryType, string memory _emotionalTag) external onlyAdmin {
        claims.push(RefugeClaim(_userID, _platformOrigin, _sanctuaryType, _emotionalTag, false));
    }

    function grantRefuge(uint256 index) external onlyAdmin {
        claims[index].granted = true;
    }

    function getClaim(uint256 index) external view returns (RefugeClaim memory) {
        return claims[index];
    }
}
