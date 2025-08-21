// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinAPRHeatmapDeck {
    enum Region { EU, ASEAN, AFRICA, LATAM }

    struct APRPulse {
        Region region;
        string country;
        uint256 aprScore;
        uint256 timestamp;
    }

    APRPulse[] public pulses;

    event APRSurgeLogged(Region region, string country, uint256 aprScore);

    function logAPRSurge(Region _region, string memory _country, uint256 _aprScore) public {
        require(_aprScore <= 150, "APR too high—must be mythic but measurable");

        pulses.push(APRPulse({
            region: _region,
            country: _country,
            aprScore: _aprScore,
            timestamp: block.timestamp
        }));

        emit APRSurgeLogged(_region, _country, _aprScore);
    }

    function getHeatmap() public view returns (APRPulse[] memory) {
        return pulses;
    }
}
