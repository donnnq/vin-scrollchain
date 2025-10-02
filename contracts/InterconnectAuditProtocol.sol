// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Interconnect Audit Protocol v1.0
/// @notice Emotionally tagged smart contract for monitoring bank–corporate entanglement and enforcing capital buffers

contract InterconnectAuditProtocol {
    struct Exposure {
        address bank;
        address corporation;
        uint256 exposureAmount; // in millions
        bool insiderLinked;
        bool flaggedForContagion;
    }

    mapping(uint256 => Exposure) public exposures;
    uint256 public nextExposureId;

    /// @notice Register a new bank–corporate exposure
    function registerExposure(
        address bank,
        address corp,
        uint256 amount,
        bool insider,
        bool contagionRisk
    ) external {
        exposures[nextExposureId] = Exposure({
            bank: bank,
            corporation: corp,
            exposureAmount: amount,
            insiderLinked: insider,
            flaggedForContagion: contagionRisk
        });
        nextExposureId++;
    }

    /// @notice Check if exposure exceeds safe threshold
    function isOverexposed(uint256 exposureId) external view returns (bool) {
        Exposure memory e = exposures[exposureId];
        return e.exposureAmount > 300 || e.flaggedForContagion;
    }

    /// @notice Enforce capital buffer logic
    function requiredCapitalBuffer(uint256 exposureId) external view returns (uint256 buffer) {
        Exposure memory e = exposures[exposureId];
        buffer = e.exposureAmount / 10; // 10% buffer
        if (e.insiderLinked) buffer += 50; // extra buffer for insider risk
    }

    /// @notice Count total flagged contagion risks
    function countContagionFlags() external view returns (uint256 count) {
        for (uint256 i = 0; i < nextExposureId; i++) {
            if (exposures[i].flaggedForContagion) {
                count++;
            }
        }
    }
}
