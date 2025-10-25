// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeRouteToSanctionForecastProtocol {
    address public steward;

    struct ForecastEntry {
        string routeName; // "China → Vietnam → US"
        string commodity; // "Rare Earths"
        string sanctionType; // "Tariff", "Ban", "Audit freeze"
        string forecastSignal; // "High risk", "Pending retaliation"
        string emotionalTag;
        bool forecasted;
        bool sealed;
    }

    ForecastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function forecastSanction(string memory routeName, string memory commodity, string memory sanctionType, string memory forecastSignal, string memory emotionalTag) external onlySteward {
        entries.push(ForecastEntry(routeName, commodity, sanctionType, forecastSignal, emotionalTag, true, false));
    }

    function sealForecastEntry(uint256 index) external onlySteward {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
