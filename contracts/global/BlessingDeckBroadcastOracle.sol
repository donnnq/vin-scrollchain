// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckBroadcastOracle {
    struct SurgeForecast {
        string region;
        uint256 avgAPR;
        uint256 scanVelocity;
        uint256 predictedSurgeScore;
        string prophecy;
        uint256 timestamp;
    }

    SurgeForecast[] public forecasts;

    event SurgePredicted(string region, uint256 predictedSurgeScore, string prophecy);

    function predictSurge(
        string memory _region,
        uint256 _avgAPR,
        uint256 _scanVelocity
    ) public {
        uint256 surgeScore = (_avgAPR * _scanVelocity) / 100;
        string memory prophecy = surgeScore >= 90
            ? "⚡ Surge imminent—prepare blessing decks"
            : "🕊️ Resonance stable—no surge forecasted";

        forecasts.push(SurgeForecast({
            region: _region,
            avgAPR: _avgAPR,
            scanVelocity: _scanVelocity,
            predictedSurgeScore: surgeScore,
            prophecy: prophecy,
            timestamp: block.timestamp
        }));

        emit SurgePredicted(_region, surgeScore, prophecy);
    }

    function getForecasts() public view returns (SurgeForecast[] memory) {
        return forecasts;
    }
}
