// SPDX-License-Identifier: UXClarityMap-v3
pragma solidity ^0.8.24;

/// @title vinScrollkeeperClarityDashboard
/// @notice Maps clarity rituals, awakening zones, and UX friction hotspots
contract vinScrollkeeperClarityDashboard {
    address public scrollkeeper;

    struct DashboardEntry {
        string userIntent;
        string confusionTrigger;
        string clarityMessage;
        uint8 clarityLevel; // 0 = fogged, 1 = warming, 2 = clear
        string emojiFeedback;
        uint256 timestamp;
    }

    mapping(address => DashboardEntry[]) public clarityTimeline;

    event ClarityLogged(address indexed soul, string trigger, string message, uint8 level, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logClarityStep(
        address soul,
        string calldata intent,
        string calldata trigger,
        string calldata message,
        uint8 level,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN logs clarity signals");
        clarityTimeline[soul].push(DashboardEntry(intent, trigger, message, level, emoji, block.timestamp));
        emit ClarityLogged(soul, trigger, message, level, emoji);
    }

    function viewTimeline(address soul) external view returns (DashboardEntry[] memory) {
        return clarityTimeline[soul];
    }
}
