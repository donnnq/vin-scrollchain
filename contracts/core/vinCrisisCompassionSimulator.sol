// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.19;

contract vinCrisisCompassionSimulator {
    address public scrollcaster;
    struct RegionImpact {
        string region;
        uint256 compassionLevel;
        bool resetTriggered;
    }

    mapping(string => RegionImpact) public auraScan;
    event CompassionBroadcasted(string region, uint256 intensity, bool emotionalReset);

    constructor() {
        scrollcaster = msg.sender;
    }

    function broadcastCompassion(string memory region, uint256 intensity) external {
        require(msg.sender == scrollcaster, "Only VINVIN may deploy compassion.");
        bool reset = intensity > 70;
        auraScan[region] = RegionImpact(region, intensity, reset);

        emit CompassionBroadcasted(region, intensity, reset);
    }

    function getImpact(string memory region) external view returns (RegionImpact memory) {
        return auraScan[region];
    }
}
