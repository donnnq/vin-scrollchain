// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketVolatilityHeatmapDAO {
    address public steward;

    struct VolatilityZone {
        string assetClass;
        string region;
        uint256 volatilityScore;
        string timestamp;
        string emotionalTag;
    }

    VolatilityZone[] public heatmap;

    event VolatilityZoneLogged(string assetClass, string region, uint256 volatilityScore, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logZone(
        string memory assetClass,
        string memory region,
        uint256 volatilityScore,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        heatmap.push(VolatilityZone(assetClass, region, volatilityScore, timestamp, emotionalTag));
        emit VolatilityZoneLogged(assetClass, region, volatilityScore, timestamp, emotionalTag);
    }
}
