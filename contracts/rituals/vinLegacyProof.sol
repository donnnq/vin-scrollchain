// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinLegacyProof.sol
/// @author VINVIN
/// @notice Registers soulbound claims with VINVIN-style identity, purpose, and provenance audit

contract vinLegacyProof {
    address public scrollkeeper;
    mapping(bytes32 => bool) public verifiedClaims;

    event LegacyStamped(bytes32 claimHash, string label, address claimant);
    event LegacyRejected(bytes32 claimHash, string reason);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized: Only scrollkeeper may sign legacy");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Submit proof of origin for mythstream legitimacy
    function stampLegacy(address claimant, string memory label) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(claimant, label));
        verifiedClaims[hash] = true;
        emit LegacyStamped(hash, label, claimant);
    }

    /// @notice Validate legacy status of a claim
    function isStamped(bytes32 claimHash) external view returns (bool) {
        return verifiedClaims[claimHash];
    }

    /// @notice Revoke suspicious proof
    function rejectLegacy(address claimant, string memory label, string memory reason) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(claimant, label));
        verifiedClaims[hash] = false;
        emit LegacyRejected(hash, reason);
    }
}
