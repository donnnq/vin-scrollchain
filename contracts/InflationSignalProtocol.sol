// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Inflation Signal Protocol v1.0
/// @notice Emotionally tagged smart contract for tracking PH inflation triggers and corridor impact

contract InflationSignalProtocol {
    struct InflationTrigger {
        string category;
        uint256 priceIndex; // e.g. rice = 120 means 20% above baseline
        bool isVolatile;
        bool corridorSensitive;
    }

    InflationTrigger[] public triggers;

    /// @notice Add a new inflation trigger
    function addTrigger(
        string memory category,
        uint256 index,
        bool volatile,
        bool sensitive
    ) external {
        triggers.push(InflationTrigger({
            category: category,
            priceIndex: index,
            isVolatile: volatile,
            corridorSensitive: sensitive
        }));
    }

    /// @notice Check if a trigger exceeds inflation threshold
    function isAboveThreshold(uint256 triggerId) external view returns (bool) {
        require(triggerId < triggers.length, "Invalid trigger ID");
        return triggers[triggerId].priceIndex > 110; // 10% above baseline
    }

    /// @notice Count corridor-sensitive inflation triggers
    function countCorridorSensitive() external view returns (uint256 count) {
        for (uint256 i = 0; i < triggers.length; i++) {
            if (triggers[i].corridorSensitive) {
                count++;
            }
        }
    }

    /// @notice Get emotional tags for inflation response
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🧭 Restoration, 🌱 Empowerment";
    }
}
