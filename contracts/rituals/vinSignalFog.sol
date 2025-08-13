// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSignalFog {
    struct CloakPulse {
        string fleetName;
        string region;
        uint256 intensity; // 0–100
        uint256 timestamp;
    }

    mapping(string => bool) public isCloaked;
    CloakPulse[] public pulses;

    event FleetCloaked(string fleetName, string region, uint256 intensity, uint256 timestamp);

    function activateFog(string memory fleetName, string memory region, uint256 intensity) public {
        require(intensity <= 100, "Fog too thick, scrollsmith.");
        isCloaked[fleetName] = true;
        pulses.push(CloakPulse(fleetName, region, intensity, block.timestamp));
        emit FleetCloaked(fleetName, region, intensity, block.timestamp);
    }

    function revealFleet(string memory fleetName) public {
        isCloaked[fleetName] = false;
    }

    function getRecentPulses(uint count) public view returns (CloakPulse[] memory) {
        require(count <= pulses.length, "Not enough pulses.");
        CloakPulse[] memory recent = new CloakPulse[](count);
        for (uint i = 0; i < count; i++) {
            recent[i] = pulses[pulses.length - 1 - i];
        }
        return recent;
    }
}
