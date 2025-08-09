// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title WorldIDVerifier - Ritual scroll for verifying World ID status and access eligibility
/// @author Vinvin
/// @notice Checks humanness, flag status, and optional zk-proof for mythic access

contract WorldIDVerifier {
    address public scrollsmith;

    mapping(address => bool) public isHuman;
    mapping(address => bool) public isFlagged;
    mapping(address => bytes32) public zkProofHash;

    event HumanVerified(address indexed user);
    event UserFlagged(address indexed user);
    event ZKProofSubmitted(address indexed user, bytes32 proofHash);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Ritual verification of humanness
    function verifyHuman(address user) external onlyScrollsmith {
        require(!isFlagged[user], "User is flagged");
        isHuman[user] = true;
        emit HumanVerified(user);
    }

    /// @notice Flag a user for suspicious activity
    function flagUser(address user) external onlyScrollsmith {
        isFlagged[user] = true;
        emit UserFlagged(user);
    }

    /// @notice Submit zk-proof hash for advanced verification
    function submitZKProof(address user, bytes32 proofHash) external onlyScrollsmith {
        zkProofHash[user] = proofHash;
        emit ZKProofSubmitted(user, proofHash);
    }

    /// @notice Check if user is verified and unflagged
    function isVerified(address user) external view returns (bool) {
        return isHuman[user] && !isFlagged[user];
    }

    /// @notice Check if zk-proof exists for user
    function hasZKProof(address user) external view returns (bool) {
        return zkProofHash[user] != bytes32(0);
    }
}
