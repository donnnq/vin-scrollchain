// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffShockForecastProtocol {
    address public admin;

    struct ForecastEntry {
        string country; // "Philippines"
        string sector; // "Electronics", "Agriculture"
        string forecastType; // "US tariff escalation", "Sectoral levy risk"
        string emotionalTag;
        bool forecasted;
        bool sealed;
    }

    ForecastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logForecast(string memory country, string memory sector, string memory forecastType, string memory emotionalTag) external onlyAdmin {
        entries.push(ForecastEntry(country, sector, forecastType, emotionalTag, true, false));
    }

    function sealForecastEntry(uint256 index) external onlyAdmin {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
