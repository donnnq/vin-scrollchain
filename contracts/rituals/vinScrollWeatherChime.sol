// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollWeatherChime {
    address public pulseOracle;
    mapping(bytes32 => string) public activeWeather;
    event WeatherTuned(bytes32 ritualID, string forecast, string newWeather);

    modifier onlyOracle() {
        require(msg.sender == pulseOracle, "Only Pulse Oracle may chime");
        _;
    }

    constructor(address _pulseOracle) {
        pulseOracle = _pulseOracle;
    }

    function chimeWeather(bytes32 ritualID, string memory forecastLabel) public onlyOracle {
        string memory weather = generateWeather(forecastLabel);
        activeWeather[ritualID] = weather;
        emit WeatherTuned(ritualID, forecastLabel, weather);
    }

    function generateWeather(string memory forecastLabel) internal pure returns (string memory) {
        if (keccak256(bytes(forecastLabel)) == keccak256("Peaceflow surge imminent")) return "Hope Rain";
        if (keccak256(bytes(forecastLabel)) == keccak256("Kindness convergence approaching")) return "Kinship Wind";
        if (keccak256(bytes(forecastLabel)) == keccak256("Harvest signal intensifying")) return "Abundance Mist";
        return "Ambient Echo";
    }

    function fetchWeather(bytes32 ritualID) public view returns (string memory) {
        return activeWeather[ritualID];
    }

    function updateOracle(address newOracle) public {
        require(msg.sender == pulseOracle, "Oracle binding required");
        pulseOracle = newOracle;
    }
}
