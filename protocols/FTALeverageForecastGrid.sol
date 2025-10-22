// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTALeverageForecastGrid {
    address public admin;

    struct ForecastEntry {
        string country; // "Philippines"
        string partner; // "EU", "Canada", "Chile"
        string leveragePotential; // "High", "Moderate", "Low"
        string forecastSignal; // "Tariff shield", "Market access", "Strategic alignment"
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

    function forecastLeverage(string memory country, string memory partner, string memory leveragePotential, string memory forecastSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ForecastEntry(country, partner, leveragePotential, forecastSignal, emotionalTag, true, false));
    }

    function sealForecastEntry(uint256 index) external onlyAdmin {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
