// SPDX-License-Identifier: SoulstreamReflection-Vault003
pragma solidity ^0.8.24;

/// @title vinVaultOfScrollkeeperReflections
/// @notice Logs philosophical insights, emotional shifts, and mythstream turning points
contract vinVaultOfScrollkeeperReflections {
    address public scrollkeeper;

    struct ReflectionEntry {
        string ritualName;
        string momentOfAwakening;
        string symbolicInsight;
        string feelingEmoji;
        uint256 timestamp;
    }

    mapping(address => ReflectionEntry[]) public soulReflectionLog;

    event ReflectionLogged(address indexed soul, string ritual, string insight, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logReflection(
        address soul,
        string calldata ritualName,
        string calldata awakeningMoment,
        string calldata insight,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN records scrollkeeper reflections");

        soulReflectionLog[soul].push(
            ReflectionEntry(ritualName, awakeningMoment, insight, emoji, block.timestamp)
        );
        emit ReflectionLogged(soul, ritualName, insight, emoji);
    }

    function viewReflections(address soul) external view returns (ReflectionEntry[] memory) {
        return soulReflectionLog[soul];
    }
}
