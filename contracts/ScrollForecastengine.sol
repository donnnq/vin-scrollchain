// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollForecastEngine {
    struct Forecast {
        string token;
        string condition;
        string commentary;
        uint256 timestamp;
        address forecaster;
    }

    Forecast[] public forecasts;
    mapping(string => uint256[]) public tokenToForecasts;

    event ForecastPosted(string token, string condition, address indexed forecaster);

    function postForecast(
        string calldata token,
        string calldata condition,
        string calldata commentary
    ) external {
        forecasts.push(Forecast(token, condition, commentary, block.timestamp, msg.sender));
        tokenToForecasts[token].push(forecasts.length - 1);
        emit ForecastPosted(token, condition, msg.sender);
    }

    function getForecast(uint256 index) external view returns (string memory, string memory, string memory, uint256, address) {
        Forecast memory f = forecasts[index];
        return (f.token, f.condition, f.commentary, f.timestamp, f.forecaster);
    }

    function totalForecasts() external view returns (uint256) {
        return forecasts.length;
    }
}
