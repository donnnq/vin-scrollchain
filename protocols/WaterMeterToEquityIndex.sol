// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterMeterToEquityIndex {
    address public steward;

    struct MeterEntry {
        string householdID;
        uint meterReading; // e.g. 7.5 cu.m.
        string equitySignal; // "Lifeline qualified", "Billing anomaly", "Subsidy eligible"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MeterEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexMeter(string memory householdID, uint meterReading, string memory equitySignal, string memory emotionalTag) external onlySteward {
        entries.push(MeterEntry(householdID, meterReading, equitySignal, emotionalTag, true, false));
    }

    function sealMeterEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMeterEntry(uint256 index) external view returns (MeterEntry memory) {
        return entries[index];
    }
}
