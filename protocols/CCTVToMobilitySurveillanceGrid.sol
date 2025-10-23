// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CCTVToMobilitySurveillanceGrid {
    address public steward;

    struct SurveillanceEntry {
        string location; // "Pasig Esplanade"
        string mobilityType; // "E-bike", "E-scooter"
        string surveillanceMode; // "CCTV feed patrol", "Vendor zone monitoring"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    SurveillanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateSurveillance(string memory location, string memory mobilityType, string memory surveillanceMode, string memory emotionalTag) external onlySteward {
        entries.push(SurveillanceEntry(location, mobilityType, surveillanceMode, emotionalTag, true, false));
    }

    function sealSurveillanceEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSurveillanceEntry(uint256 index) external view returns (SurveillanceEntry memory) {
        return entries[index];
    }
}
