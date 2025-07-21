// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinQuantumFallbackProtocol
/// @notice VINVIN’s legacy-to-post-quantum migration guardian
/// @dev Tracks recovery entropy, fallback keys, and timestamped rituals

contract vinQuantumFallbackProtocol {
    event FallbackEngaged(address indexed vault, string fallbackPhrase, uint256 timestamp);
    event LegacyAddressIndexed(address indexed user, bytes32 legacyHash);
    event QuantumSigMigrated(address indexed user, bytes32 newSigil, uint256 timestamp);

    mapping(address => string) public fallbackPhrases;
    mapping(address => bytes32) public legacyHashes;
    mapping(address => bytes32) public quantumSigils;

    /// @notice Register a hash of your legacy key/address
    function registerLegacy(bytes32 hash) external {
        legacyHashes[msg.sender] = hash;
        emit LegacyAddressIndexed(msg.sender, hash);
    }

    /// @notice Set your human-readable recovery phrase
    function engageFallback(string memory phrase) external {
        fallbackPhrases[msg.sender] = phrase;
        emit FallbackEngaged(msg.sender, phrase, block.timestamp);
    }

    /// @notice Migrate to a post-quantum-resistant signature identifier
    function migrateSigil(bytes32 newSigil) external {
        quantumSigils[msg.sender] = newSigil;
        emit QuantumSigMigrated(msg.sender, newSigil, block.timestamp);
    }

    /// @notice Retrieve the recovery phrase for a given user
    function checkRecoveryPhrase(address user) external view returns (string memory) {
        return fallbackPhrases[user];
    }

    /// @notice Retrieve the legacy hash for a given user
    function getLegacyHash(address user) external view returns (bytes32) {
        return legacyHashes[user];
    }

    /// @notice Retrieve the migrated quantum signature for a given user
    function getQuantumSigil(address user) external view returns (bytes32) {
        return quantumSigils[user];
    }
}
