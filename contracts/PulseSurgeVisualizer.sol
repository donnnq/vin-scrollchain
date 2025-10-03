// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Pulse Surge Visualizer Protocol v1.0
/// @notice Graphs emotional APR volatility across corridors and protocols

contract PulseSurgeVisualizer {
    address public originator;

    struct SurgeNode {
        string corridorTag;
        string emotionalAPRTag;
        uint256 surgeLevel;
        uint256 timestamp;
    }

    SurgeNode[] public surgeLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSurge(
        string memory corridorTag,
        string memory emotionalAPRTag,
        uint256 surgeLevel
    ) external {
        surgeLedger.push(SurgeNode({
            corridorTag: corridorTag,
            emotionalAPRTag: emotionalAPRTag,
            surgeLevel: surgeLevel,
            timestamp: block.timestamp
        }));
    }

    function getLatestSurge() external view returns (SurgeNode memory) {
        require(surgeLedger.length > 0, "No surges logged yet");
        return surgeLedger[surgeLedger.length - 1];
    }
}
