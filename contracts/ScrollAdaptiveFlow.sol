// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollAdaptiveFlow {
    struct FlowProfile {
        uint256 taps;
        uint256 lastTap;
        uint8 tempo; // 1 = chill, 2 = normal, 3 = intense
    }

    mapping(address => FlowProfile) public profiles;
    event FlowUpdated(address indexed user, uint8 newTempo);

    function registerTap() external {
        FlowProfile storage fp = profiles[msg.sender];
        uint256 nowTime = block.timestamp;

        fp.taps += 1;
        uint256 gap = nowTime - fp.lastTap;
        fp.lastTap = nowTime;

        if (gap > 8) fp.tempo = 1;       // chill
        else if (gap > 3) fp.tempo = 2;  // normal
        else fp.tempo = 3;              // intense

        emit FlowUpdated(msg.sender, fp.tempo);
    }

    function getFlow() external view returns (uint256, uint8) {
        FlowProfile memory fp = profiles[msg.sender];
        return (fp.taps, fp.tempo);
    }
}
