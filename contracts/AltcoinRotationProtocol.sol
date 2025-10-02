// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Altcoin Rotation Protocol v1.0
/// @notice Emotionally tagged smart contract for tracking altcoin season signals and macro-linked asset flows

contract AltcoinRotationProtocol {
    struct RotationSignal {
        string asset;
        uint256 weeklyGain; // in percentage
        uint256 dominanceShift; // e.g. -0.14% BTC dominance
        bool isLayer1;
        bool isNarrativeDriven;
    }

    RotationSignal[] public signals;

    /// @notice Register a new altcoin rotation signal
    function registerSignal(
        string memory asset,
        uint256 gain,
        uint256 dominanceShift,
        bool layer1,
        bool narrativeDriven
    ) external {
        signals.push(RotationSignal({
            asset: asset,
            weeklyGain: gain,
            dominanceShift: dominanceShift,
            isLayer1: layer1,
            isNarrativeDriven: narrativeDriven
        }));
    }

    /// @notice Count Layer 1 tokens gaining traction
    function countLayer1Momentum() external view returns (uint256 count) {
        for (uint256 i = 0; i < signals.length; i++) {
            if (signals[i].isLayer1) {
                count++;
            }
        }
    }

    /// @notice Get average weekly gain across all signals
    function averageWeeklyGain() external view returns (uint256 avg) {
        uint256 total;
        for (uint256 i = 0; i < signals.length; i++) {
            total += signals[i].weeklyGain;
        }
        avg = signals.length > 0 ? total / signals.length : 0;
    }

    /// @notice Emotional tags for community clarity
    function emotionalTags() external pure returns (string memory tags) {
        return "🌶️ Momentum, 🧠 Macro Clarity, 🌱 Community Sovereignty";
    }
}
