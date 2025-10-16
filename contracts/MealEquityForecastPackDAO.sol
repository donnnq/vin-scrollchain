// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MealEquityForecastPackDAO {
    address public admin;

    struct ForecastEntry {
        string workerClass;
        string forecastClause;
        string emotionalTag;
        bool published;
    }

    ForecastEntry[] public forecasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerClass, string memory _forecastClause, string memory _emotionalTag) external onlyAdmin {
        forecasts.push(ForecastEntry(_workerClass, _forecastClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        forecasts[index].published = true;
    }

    function getEntry(uint256 index) external view returns (ForecastEntry memory) {
        return forecasts[index];
    }
}
