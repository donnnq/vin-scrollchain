// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Circuit Optimizer
/// @notice Logs optimized zk circuit deployments, benchmarking metrics, and verifier commitment hashes
contract vinCircuitOptimizer {
    struct OptimizationReport {
        uint256 timestamp;
        address optimizer;
        string circuitName;
        string gnarkVersion;
        uint256 constraintCount;
        uint256 provingTimeMs;
        string hashCommitment; // Poseidon-based verifier commitment
        string remarks;
    }

    address public scrollkeeper;
    uint256 public reportCount;
    mapping(uint256 => OptimizationReport) public reports;

    event CircuitOptimized(
        uint256 indexed id,
        address indexed optimizer,
        string circuitName,
        string gnarkVersion,
        string hashCommitment
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logOptimization(
        string memory _circuitName,
        string memory _gnarkVersion,
        uint256 _constraintCount,
        uint256 _provingTimeMs,
        string memory _hashCommitment,
        string memory _remarks
    ) public {
        reports[reportCount] = OptimizationReport({
            timestamp: block.timestamp,
            optimizer: msg.sender,
            circuitName: _circuitName,
            gnarkVersion: _gnarkVersion,
            constraintCount: _constraintCount,
            provingTimeMs: _provingTimeMs,
            hashCommitment: _hashCommitment,
            remarks: _remarks
        });

        emit CircuitOptimized(
            reportCount,
            msg.sender,
            _circuitName,
            _gnarkVersion,
            _hashCommitment
        );

        reportCount++;
    }

    function getReport(uint256 _id) public view returns (OptimizationReport memory) {
        require(_id < reportCount, "Report not found");
        return reports[_id];
    }
}
