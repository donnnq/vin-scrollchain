// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSilentFleetProtocol {
    struct SilentMission {
        string region;
        int256 emotionalThreshold;
        string encodedPurpose;
        bool activated;
        uint256 timestamp;
    }

    SilentMission[] public missions;

    event SilentMissionActivated(string region, int256 threshold, string purpose);

    function activateSilentMission(
        string memory region,
        int256 emotionalThreshold,
        string memory encodedPurpose
    ) public {
        require(emotionalThreshold >= -100 && emotionalThreshold <= 100, "Invalid threshold.");
        missions.push(SilentMission(region, emotionalThreshold, encodedPurpose, true, block.timestamp));
        emit SilentMissionActivated(region, emotionalThreshold, encodedPurpose);
    }

    function getMission(uint index) public view returns (
        string memory, int256, string memory, bool, uint256
    ) {
        SilentMission memory m = missions[index];
        return (m.region, m.emotionalThreshold, m.encodedPurpose, m.activated, m.timestamp);
    }

    function totalMissions() public view returns (uint) {
        return missions.length;
    }
}
