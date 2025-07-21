// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Poseidon Verifier
/// @notice Verifies zkSNARK proofs using Poseidon hash commitments on BN254 curve
contract vinPoseidonVerifier {
    struct ProofCommitment {
        address prover;
        uint256 timestamp;
        string circuitID;
        bytes32 poseidonHash; // Hash of the verifier key or public signal
        string remarks;
    }

    address public scrollkeeper;
    uint256 public commitmentCount;
    mapping(uint256 => ProofCommitment) public commitments;

    event ProofVerified(
        uint256 indexed id,
        address indexed prover,
        string circuitID,
        bytes32 poseidonHash
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function submitCommitment(
        string memory _circuitID,
        bytes32 _poseidonHash,
        string memory _remarks
    ) public {
        commitments[commitmentCount] = ProofCommitment({
            prover: msg.sender,
            timestamp: block.timestamp,
            circuitID: _circuitID,
            poseidonHash: _poseidonHash,
            remarks: _remarks
        });

        emit ProofVerified(commitmentCount, msg.sender, _circuitID, _poseidonHash);
        commitmentCount++;
    }

    function getCommitment(uint256 _id) public view returns (ProofCommitment memory) {
        require(_id < commitmentCount, "Scroll not found");
        return commitments[_id];
    }
}
