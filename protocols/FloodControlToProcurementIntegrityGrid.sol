// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlToProcurementIntegrityGrid {
    address public steward;

    struct IntegrityEntry {
        string projectName; // "Flood control initiative"
        string anomalyType; // "Procurement irregularity", "Fund misallocation"
        string traceMethod; // "Scrollchain audit", "COA report", "Barangay witness"
        string emotionalTag;
        bool traced;
        bool sealed;
    }

    IntegrityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function traceAnomaly(string memory projectName, string memory anomalyType, string memory traceMethod, string memory emotionalTag) external onlySteward {
        entries.push(IntegrityEntry(projectName, anomalyType, traceMethod, emotionalTag, true, false));
    }

    function sealIntegrityEntry(uint256 index) external onlySteward {
        require(entries[index].traced, "Must be traced first");
        entries[index].sealed = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
