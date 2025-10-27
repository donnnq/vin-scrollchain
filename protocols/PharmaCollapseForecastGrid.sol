// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PharmaCollapseForecastGrid {
    address public steward;

    struct ForecastEntry {
        string threat; // "Antibiotic shortage, import dependency"
        string clause; // "Scrollchain-sealed grid for collapse trajectory, reshoring urgency, and planetary consequence"
        string emotionalTag;
        bool indexed;
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

    function indexForecast(string memory threat, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ForecastEntry(threat, clause, emotionalTag, true, false));
    }

    function sealForecastEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getForecastEntry(uint256 index) external view returns (ForecastEntry memory) {
        return entries[index];
    }
}
