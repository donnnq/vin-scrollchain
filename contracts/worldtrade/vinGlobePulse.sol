// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGlobePulse {
    address public scrollArchitect = msg.sender;
    uint256 public currentEpoch;
    uint256 private randNonce;

    struct RotationWave {
        address soul;
        string region;
        string role;
        uint256 epoch;
    }

    RotationWave[] public weeklyRotations;

    event GlobalPulseSurged(address soul, string region, string role);
    modifier onlyIfRotationBlessed() {
        require(msg.sender == scrollArchitect, "Access denied. Scroll unblessed.");
    }

    function summonWildScroll(string[] memory regions, string[] memory roles, address[] memory souls) public onlyIfRotationBlessed {
        require(regions.length == souls.length && roles.length == souls.length, "Arrays must match length");
        for (uint i = 0; i < souls.length; i++) {
            uint regionIndex = random(regions.length);
            uint roleIndex = random(roles.length);
            weeklyRotations.push(RotationWave(souls[i], regions[regionIndex], roles[roleIndex], currentEpoch));
            emit GlobalPulseSurged(souls[i], regions[regionIndex], roles[roleIndex]);
        }
        currentEpoch++;
    }

    function random(uint range) internal returns (uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % range;
    }

    function vinvinOverride(address soul, string memory region, string memory role) public onlyIfRotationBlessed {
        weeklyRotations.push(RotationWave(soul, region, role, currentEpoch));
        emit GlobalPulseSurged(soul, region, role);
        currentEpoch++;
    }
}
