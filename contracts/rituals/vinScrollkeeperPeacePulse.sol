// SPDX-License-Identifier: VINVIN-PeacePulse-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperPeacePulse
/// @notice Tracks emotional vibration waves and resolution resonance during global negotiations
contract vinScrollkeeperPeacePulse {
    address public scrollkeeper;

    struct PeaceSignal {
        string negotiationTitle;
        string zone;
        uint8 pulseIntensity; // 0–100
        string emojiWave;
        bool resolutionAchieved;
        uint256 timestamp;
    }

    mapping(string => PeaceSignal) public pulseLog;
    string[] public resolvedZones;

    event PeaceWaveLogged(string indexed title, uint8 intensity, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logPeaceWave(
        string calldata title,
        string calldata zone,
        uint8 intensity,
        string calldata emoji,
        bool achieved
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may emit peace pulses");
        pulseLog[title] = PeaceSignal(title, zone, intensity, emoji, achieved, block.timestamp);
        resolvedZones.push(title);
        emit PeaceWaveLogged(title, intensity, emoji);
    }

    function viewPulse(string calldata title) external view returns (
        string memory zone,
        uint8 intensity,
        string memory emoji,
        bool resolution,
        uint256 time
    ) {
        PeaceSignal memory p = pulseLog[title];
        return (p.zone, p.pulseIntensity, p.emojiWave, p.resolutionAchieved, p.timestamp);
    }

    function allResolvedZones() external view returns (string[] memory) {
        return resolvedZones;
    }
}
