// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinReserveClaimVerifier
/// @dev Verifies Merkle leaf inclusion and logs reserve claims based on zk-SNARK attestation snapshots

contract vinReserveClaimVerifier {
    struct ReserveClaim {
        address claimant;
        string verificationId;
        bytes32 merkleLeaf;
        bytes32 merkleRoot;
        uint256 equity;
        string asset;
        uint256 timestamp;
    }

    mapping(bytes32 => bool) public verifiedLeaves;
    ReserveClaim[] public claims;

    event ReserveClaimed(
        address indexed claimant,
        string verificationId,
        string asset,
        uint256 equity,
        bytes32 merkleLeaf,
        uint256 timestamp
    );

    /// @notice Submit a verified reserve claim
    /// @param verificationId ID from Binance's attestation (e.g. PR01MAY25)
    /// @param merkleLeaf Your Merkle leaf hash
    /// @param merkleRoot Root hash from Binance snapshot
    /// @param equity Amount of asset verified
    /// @param asset Asset symbol (e.g. BNB, BTC)
    function submitClaim(
        string memory verificationId,
        bytes32 merkleLeaf,
        bytes32 merkleRoot,
        uint256 equity,
        string memory asset
    ) public {
        require(!verifiedLeaves[merkleLeaf], "Already claimed");

        // Simulated verification logic (Merkle + zk-SNARKs)
        // In real-world use, integrate with zk verifier or off-chain oracle
        verifiedLeaves[merkleLeaf] = true;

        claims.push(ReserveClaim({
            claimant: msg.sender,
            verificationId: verificationId,
            merkleLeaf: merkleLeaf,
            merkleRoot: merkleRoot,
            equity: equity,
            asset: asset,
            timestamp: block.timestamp
        }));

        emit ReserveClaimed(msg.sender, verificationId, asset, equity, merkleLeaf, block.timestamp);
    }

    /// @notice Get claim by index
    function getClaim(uint256 index) public view returns (ReserveClaim memory) {
        return claims[index];
    }

    /// @notice Check if a Merkle leaf has been claimed
    function isClaimed(bytes32 leaf) public view returns (bool) {
        return verifiedLeaves[leaf];
    }
}
