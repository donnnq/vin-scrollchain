// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollHealer — Ritual scroll for civic healing and emotional restoration
contract vinScrollHealer {
    struct Healing {
        address target;
        string gesture;
        string message;
        address healer;
        uint256 timestamp;
    }

    Healing[] public healings;
    mapping(address => uint256) public healingScore;

    event HealingBlessed(address indexed target, address indexed healer, string gesture, string message);

    /// @notice Submit a healing gesture for a roasted scroll or civic soul
    function submitHealing(address target, string memory gesture, string memory message) external {
        healings.push(Healing({
            target: target,
            gesture: gesture,
            message: message,
            healer: msg.sender,
            timestamp: block.timestamp
        }));

        healingScore[target]++;
        emit HealingBlessed(target, msg.sender, gesture, message);
    }

    /// @notice Get all healing gestures for a target
    function getHealingsBy(address target) external view returns (Healing[] memory filtered) {
        uint256 count;
        for (uint i = 0; i < healings.length; i++) {
            if (healings[i].target == target) count++;
        }

        filtered = new Healing[](count);
        uint256 idx;
        for (uint i = 0; i < healings.length; i++) {
            if (healings[i].target == target) {
                filtered[idx++] = healings[i];
            }
        }
    }

    /// @notice Returns total healing gestures submitted
    function totalHealings() external view returns (uint256) {
        return healings.length;
    }
}
