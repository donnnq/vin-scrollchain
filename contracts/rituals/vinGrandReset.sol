// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinGrandReset
/// @notice Let any persona reset their profile, remove old flags, and start anew with a pledge.
contract vinGrandReset is Ownable {
    struct ResetRequest {
        address user;
        string  pledge;      // e.g. "I vow to cooperate and improve"
        uint256 timestamp;   // when request was made
        bool    completed;
    }

    // user → their reset request
    mapping(address => ResetRequest) public requests;

    // event when someone asks for a reset
    event ResetRequested(address indexed user, string pledge, uint256 at);

    // event once the reset is approved and executed
    event ResetExecuted(address indexed user);

    /// @notice Request a grand reset. Supply your personal pledge.
    function requestReset(string calldata pledge) external {
        require(bytes(pledge).length > 0, "Pledge required");
        ResetRequest storage r = requests[msg.sender];
        require(!r.completed, "Already reset");
        r.user      = msg.sender;
        r.pledge    = pledge;
        r.timestamp = block.timestamp;
        r.completed = false;
        emit ResetRequested(msg.sender, pledge, block.timestamp);
    }

    /// @notice After off-chain review (e.g. verify no pending investigations), owner executes reset.
    function executeReset(address user) external onlyOwner {
        ResetRequest storage r = requests[user];
        require(r.user == user,         "No request");
        require(!r.completed,           "Already executed");
        // clear out old profile flags in vinHumanProfile
        // e.g. IVinHumanProfile(coreAddress).resetProfile(user);
        r.completed = true;
        emit ResetExecuted(user);
    }

    /// @notice (Optional) Bulk execute resets for a list of users.
    function executeBatch(address[] calldata users) external onlyOwner {
        for (uint i = 0; i < users.length; i++) {
            executeReset(users[i]);
        }
    }
}
