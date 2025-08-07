// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vinSignalHarmonyBeacon.sol";

/// @title Scrollkeeper Dashboard
/// @notice Provides analytics on civic resonance and avatar alignment
contract vinScrollkeeperDashboard {
    vinSignalHarmonyBeacon public beacon;

    constructor(address _beaconAddress) {
        beacon = vinSignalHarmonyBeacon(_beaconAddress);
    }

    function getAverageAlignment() public view returns (int) {
        address[] memory avatars = beacon.getAllTrackedAvatars();
        if (avatars.length == 0) return 0;

        int totalScore = 0;
        for (uint i = 0; i < avatars.length; i++) {
            totalScore += beacon.getResonance(avatars[i]).alignmentScore;
        }
        return totalScore / int(avatars.length);
    }

    function getBlacklistDensity() public view returns (uint) {
        address[] memory avatars = beacon.getAllTrackedAvatars();
        uint blacklistedCount = 0;

        for (uint i = 0; i < avatars.length; i++) {
            if (beacon.getResonance(avatars[i]).isBlacklisted) {
                blacklistedCount++;
            }
        }

        if (avatars.length == 0) return 0;
        return (blacklistedCount * 100) / avatars.length; // percentage
    }

    function getEmotionDistribution(string memory _emotionTag) public view returns (uint count) {
        address[] memory avatars = beacon.getAllTrackedAvatars();
        count = 0;

        for (uint i = 0; i < avatars.length; i++) {
            if (keccak256(bytes(beacon.getResonance(avatars[i]).emotionTag)) == keccak256(bytes(_emotionTag))) {
                count++;
            }
        }
    }

    function getHostileAvatars() public view returns (address[] memory) {
        address[] memory avatars = beacon.getAllTrackedAvatars();
        uint count = 0;

        for (uint i = 0; i < avatars.length; i++) {
            if (beacon.getResonance(avatars[i]).alignmentScore < -50) {
                count++;
            }
        }

        address[] memory hostile = new address[](count);
        uint index = 0;
        for (uint i = 0; i < avatars.length; i++) {
            if (beacon.getResonance(avatars[i]).alignmentScore < -50) {
                hostile[index++] = avatars[i];
            }
        }
        return hostile;
    }
}
