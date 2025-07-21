// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinUniversalSignup
/// @notice Grants everyone free, perpetual access to all VINVIN scroll rituals
/// @author VINVIN

contract vinUniversalSignup {
    event Signup(address indexed user, uint256 timestamp);

    mapping(address => bool) public isSignedUp;

    constructor() {
        // Optional: auto-signup contract deployer
        isSignedUp[msg.sender] = true;
        emit Signup(msg.sender, block.timestamp);
    }

    /// @notice Anyone can call to register themselves for free
    function signup() external {
        require(!isSignedUp[msg.sender], "Already signed up");
        isSignedUp[msg.sender] = true;
        emit Signup(msg.sender, block.timestamp);
    }

    /// @notice Check if an address has signed up
    /// @param user Address to query
    function hasAccess(address user) external view returns (bool) {
        return isSignedUp[user];
    }
}
