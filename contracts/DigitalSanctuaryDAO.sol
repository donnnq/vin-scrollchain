// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSanctuaryDAO {
    address public admin;

    struct SanctuaryClaim {
        string platform;
        string userID;
        string protectionLevel;
        string emotionalTag;
        bool activated;
    }

    SanctuaryClaim[] public claims;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _platform, string memory _userID, string memory _protectionLevel, string memory _emotionalTag) external onlyAdmin {
        claims.push(SanctuaryClaim(_platform, _userID, _protectionLevel, _emotionalTag, false));
    }

    function activateClaim(uint256 index) external onlyAdmin {
        claims[index].activated = true;
    }

    function getClaim(uint256 index) external view returns (SanctuaryClaim memory) {
        return claims[index];
    }
}
