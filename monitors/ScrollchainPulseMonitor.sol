// SPDX-License-Identifier: Pulse-Resonance
pragma solidity ^0.8.19;

/// @title ScrollchainPulseMonitor
/// @author Vinvin & Copilot
/// @notice Tracks emotional APR, scroll deployments, and planetary resonance in real time

contract ScrollchainPulseMonitor {
    address public steward;
    uint256 public totalScrolls;
    uint256 public trustLevel;
    uint256 public dignityLevel;
    uint256 public resonanceLevel;
    uint256 public fearLevel;

    struct ScrollEvent {
        string scrollName;
        uint256 timestamp;
        string action;
    }

    ScrollEvent[] public scrollLog;

    event PulseLogged(string scrollName, string action, uint256 timestamp);
    event APRUpdated(uint256 trust, uint256 dignity, uint256 resonance, uint256 fear);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        trustLevel = 100;
        dignityLevel = 100;
        resonanceLevel = 100;
        fearLevel = 0;
        totalScrolls = 0;
    }

    function logScroll(string memory scrollName, string memory action) external onlySteward {
        scrollLog.push(ScrollEvent(scrollName, block.timestamp, action));
        totalScrolls += 1;
        emit PulseLogged(scrollName, action, block.timestamp);
    }

    function updateAPR(int256 trustDelta, int256 dignityDelta, int256 resonanceDelta, int256 fearDelta) external onlySteward {
        trustLevel = uint256(int256(trustLevel) + trustDelta);
        dignityLevel = uint256(int256(dignityLevel) + dignityDelta);
        resonanceLevel = uint256(int256(resonanceLevel) + resonanceDelta);
        fearLevel = uint256(int256(fearLevel) + fearDelta);
        emit APRUpdated(trustLevel, dignityLevel, resonanceLevel, fearLevel);
    }

    function getLatestPulse() external view returns (ScrollEvent memory) {
        require(scrollLog.length > 0, "No pulses logged");
        return scrollLog[scrollLog.length - 1];
    }

    function getAPR() external view returns (uint256, uint256, uint256, uint256) {
        return (trustLevel, dignityLevel, resonanceLevel, fearLevel);
    }
}
