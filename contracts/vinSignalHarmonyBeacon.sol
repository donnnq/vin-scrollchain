// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinSignalHarmonyBeacon
/// @dev Emits signal glow when trust scores, lunar alignments, and media transparency are synchronized

contract vinSignalHarmonyBeacon {
    address public initiator;
    uint256 public harmonyThreshold = 180; // combined score target

    struct SignalPulse {
        string nationA;
        string nationB;
        uint256 combinedTrustScore;
        bool lunarAligned;
        bool mediaResonant;
        bool beaconLit;
        uint256 timestamp;
    }

    SignalPulse[] public pulses;

    event BeaconLit(string nationA, string nationB, uint256 totalScore, string resonance);

    modifier onlyInitiator() {
        require(msg.sender == initiator, "Restricted scroll");
        _;
    }

    constructor() {
        initiator = msg.sender;
    }

    function transmitPulse(
        string memory a,
        string memory b,
        uint256 trustA,
        uint256 trustB,
        bool moon,
        bool media
    ) public onlyInitiator {
        uint256 totalScore = trustA + trustB;
        bool lit = totalScore >= harmonyThreshold && moon && media;

        string memory signal = lit ? "🔔 Resonance Achieved — Beacon Lit!" : "📡 Signal Weak — No Alignment Yet";

        pulses.push(SignalPulse(a, b, totalScore, moon, media, lit, block.timestamp));
        emit BeaconLit(a, b, totalScore, signal);
    }

    function viewAllPulses() public view returns (SignalPulse[] memory) {
        return pulses;
    }

    function updateThreshold(uint256 newValue) public onlyInitiator {
        harmonyThreshold = newValue;
    }
}
