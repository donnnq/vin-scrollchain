// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FintechCollapseForecastCodex {
    address public admin;

    struct ForecastEntry {
        string sector;
        string collapseTrigger;
        string forecastClause;
        string emotionalTag;
        bool summoned;
        bool modeled;
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

    function summonForecast(string memory sector, string memory collapseTrigger, string memory forecastClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ForecastEntry(sector, collapseTrigger, forecastClause, emotionalTag, true, false, false));
    }

    function confirmModeling(uint256 index) external onlyAdmin {
        entries[index].modeled = true;
    }

    function sealForecastEntry(uint256 index) external onlyAdmin {
        require(entries[index].modeled, "Must be modeled first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
