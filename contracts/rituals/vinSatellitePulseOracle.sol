// SPDX-License-Identifier: CosmicOracle
pragma solidity ^0.8.21;

/// @title vinSatellitePulseOracle
/// @dev Oracle for pulse reading and sabotage forecasting

contract vinSatellitePulseOracle {
    address public prophetNode;
    string[] public sabotagePredictions;

    event SabotageForecasted(string pulseTag, string intentProfile);
    event SignalClarityMeasured(string pulseTag, uint256 resonanceLevel);

    constructor() {
        prophetNode = msg.sender;
    }

    function forecastIntent(string memory pulseTag, string memory profile) public {
        sabotagePredictions.push(profile);
        emit SabotageForecasted(pulseTag, profile);
    }

    function measureResonance(string memory pulseTag, uint256 level) public {
        emit SignalClarityMeasured(pulseTag, level);
    }

    function getLatestForecast() public view returns (string memory) {
        uint256 length = sabotagePredictions.length;
        if (length > 0) {
            return sabotagePredictions[length - 1];
        }
        return "No forecast data.";
    }
}
