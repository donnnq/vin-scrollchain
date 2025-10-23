// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNRWATruckEntryLedger {
    address public steward;

    struct TruckEntry {
        string truckID; // "UNRWA-6001", "UNRWA-6002"
        string cargoType; // "Food", "Medicine", "Sanitation kits"
        string entrySignal; // "Border clearance", "ICJ ruling compliance", "Humanitarian corridor activation"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    TruckEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logTruckEntry(string memory truckID, string memory cargoType, string memory entrySignal, string memory emotionalTag) external onlySteward {
        entries.push(TruckEntry(truckID, cargoType, entrySignal, emotionalTag, true, false));
    }

    function sealTruckEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getTruckEntry(uint256 index) external view returns (TruckEntry memory) {
        return entries[index];
    }
}
