// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GlobalSanctum - Ritual scroll for tracking global openness metrics
/// @author Vinvin
/// @notice Emits openness pulses and stores regional hospitality scores

contract GlobalSanctum {
    mapping(string => uint256) public opennessScore;
    event OpennessPulse(string region, uint256 score, string message);

    /// @notice Updates openness score for a region
    function updateScore(string calldata region, uint256 score, string calldata message) external {
        opennessScore[region] = score;
        emit OpennessPulse(region, score, message);
    }

    /// @notice View openness score for a region
    function getScore(string calldata region) external view returns (uint256) {
        return opennessScore[region];
    }
}
