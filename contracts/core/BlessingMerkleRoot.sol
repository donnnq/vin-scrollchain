// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BlessingMerkleRoot - Zero-knowledge onboarding for soulbound blessings
/// @notice Verifies user eligibility via Merkle proof without exposing identity

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract BlessingMerkleRoot {
    bytes32 public immutable merkleRoot;
    address public steward;

    mapping(address => bool) public hasClaimed;

    event BlessingClaimed(address indexed user);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
        steward = msg.sender;
    }

    /// @notice Claim soulbound blessing using Merkle proof
    function claimBlessing(bytes32[] calldata _proof) external {
        require(!hasClaimed[msg.sender], "Already claimed");

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_proof, merkleRoot, leaf), "Invalid proof");

        hasClaimed[msg.sender] = true;
        emit BlessingClaimed(msg.sender);
    }

    /// @notice Steward can reset claim status (ritual override)
    function resetClaim(address _user) external onlySteward {
        hasClaimed[_user] = false;
    }
}
