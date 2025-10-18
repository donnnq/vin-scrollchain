// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalReachForecastProtocol {
    address public admin;

    struct ForecastEntry {
        string productName;
        string targetCountry;
        string emotionalTag;
        bool summoned;
        bool forecasted;
        bool exported;
    }

    ForecastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonForecast(string memory productName, string memory targetCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(ForecastEntry(productName, targetCountry, emotionalTag, true, false, false));
    }

    function forecastReach(uint256 index) external onlyAdmin {
        entries[index].forecasted = true;
    }

    function exportProduct(uint256 index) external onlyAdmin {
        require(entries[index].forecasted, "Must be forecasted first");
        entries[index].exported = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
