// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastMythosTemperatureTracker {
    address public admin;

    struct TemperatureEntry {
        string cityName; // "Baguio", "Casiguran", etc.
        string broadcastContext; // "Plunder complaint", "ICC prophecy"
        uint256 temperatureCelsius;
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    TemperatureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function trackTemperature(string memory cityName, string memory broadcastContext, uint256 temperatureCelsius, string memory emotionalTag) external onlyAdmin {
        entries.push(TemperatureEntry(cityName, broadcastContext, temperatureCelsius, emotionalTag, true, false));
    }

    function sealTemperatureEntry(uint256 index) external onlyAdmin {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getTemperatureEntry(uint256 index) external view returns (TemperatureEntry memory) {
        return entries[index];
    }
}
