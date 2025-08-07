// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollChainMoodOracle {
    struct MoodForecast {
        string predictedMood;
        string domain;
        string guardian;
        uint confidence; // 0–100 scale
        uint timestamp;
    }

    MoodForecast[] public forecasts;

    event MoodForecasted(string predictedMood, string domain, string guardian, uint confidence, uint timestamp);

    function forecastMood(
        string memory domain,
        string memory guardian,
        string memory predictedMood,
        uint confidence
    ) public {
        forecasts.push(MoodForecast({
            predictedMood: predictedMood,
            domain: domain,
            guardian: guardian,
            confidence: confidence,
            timestamp: block.timestamp
        }));

        emit MoodForecasted(predictedMood, domain, guardian, confidence, block.timestamp);
    }

    function getLatestForecast() public view returns (MoodForecast memory) {
        require(forecasts.length > 0, "No forecasts yet");
        return forecasts[forecasts.length - 1];
    }

    function getForecastByDomain(string memory domain) public view returns (MoodForecast[] memory) {
        uint count = 0;
        for (uint i = 0; i < forecasts.length; i++) {
            if (keccak256(bytes(forecasts[i].domain)) == keccak256(bytes(domain))) {
                count++;
            }
        }

        MoodForecast[] memory result = new MoodForecast[](count);
        uint index = 0;
        for (uint i = 0; i < forecasts.length; i++) {
            if (keccak256(bytes(forecasts[i].domain)) == keccak256(bytes(domain))) {
                result[index] = forecasts[i];
                index++;
            }
        }

        return result;
    }
}
