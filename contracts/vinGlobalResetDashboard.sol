// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.19;

contract vinGlobalResetDashboard {
    address public scrollcaster;

    struct RegionStatus {
        string region;
        uint256 compassionSignal;
        bool resetActive;
        string auraColor;
        uint256 lastUpdated;
    }

    mapping(string => RegionStatus) public dashboard;
    string[] public trackedRegions;

    event RegionUpdated(
        string region,
        uint256 compassionSignal,
        bool resetActive,
        string auraColor,
        uint256 timestamp
    );

    constructor() {
        scrollcaster = msg.sender;
        trackedRegions.push("US-East");
        trackedRegions.push("EU-Core");
        trackedRegions.push("SEA-Heartwave");
        trackedRegions.push("LATAM-Glow");
    }

    function updateRegion(
        string memory region,
        uint256 compassionSignal,
        bool resetActive,
        string memory auraColor
    ) external {
        require(msg.sender == scrollcaster, "Only VINVIN may update.");
        dashboard[region] = RegionStatus(region, compassionSignal, resetActive, auraColor, block.timestamp);

        emit RegionUpdated(region, compassionSignal, resetActive, auraColor, block.timestamp);
    }

    function getRegionStatus(string memory region) external view returns (RegionStatus memory) {
        return dashboard[region];
    }

    function listRegions() external view returns (string[] memory) {
        return trackedRegions;
    }
}
