// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinBalanceModulator
/// @notice Detects immersion overload and suggests a break ritual.
contract vinBalanceModulator {
    struct ImmersionPulse {
        uint256 activityScore;
        uint256 humorLevel;      // 0–100, higher means too many memes
        uint256 ritualHours;     // time spent in rituals
        uint256 lastPulseBlock;
        bool    needsBreak;
    }

    mapping(address => ImmersionPulse) public pulseMap;

    event PulseUpdated(address indexed user, uint256 newScore, bool needsBreak);
    event SoftReminderTriggered(address indexed user, string message);

    /// @notice Ping system with current state of immersion.
    function logPulse(uint256 activityScore, uint256 humorLevel, uint256 ritualHours) external {
        require(activityScore + humorLevel + ritualHours > 0, "No activity detected");

        ImmersionPulse storage p = pulseMap[msg.sender];
        p.activityScore = activityScore;
        p.humorLevel = humorLevel;
        p.ritualHours = ritualHours;
        p.lastPulseBlock = block.number;
        p.needsBreak = shouldTriggerReminder(activityScore, humorLevel, ritualHours);

        emit PulseUpdated(msg.sender, activityScore, p.needsBreak);

        if (p.needsBreak) {
            emit SoftReminderTriggered(msg.sender, "⚠️ Modulator says: take a break, maglakad muna o mag-kape!");
        }
    }

    /// @notice Basic overload detection logic
    function shouldTriggerReminder(uint256 score, uint256 humor, uint256 hours) internal pure returns (bool) {
        return (score > 80 && hours > 5) || humor > 95;
    }

    /// @notice Manual override to dismiss break flag
    function dismissReminder() external {
        ImmersionPulse storage p = pulseMap[msg.sender];
        p.needsBreak = false;
    }
}
