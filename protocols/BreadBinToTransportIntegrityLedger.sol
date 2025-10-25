// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BreadBinToTransportIntegrityLedger {
    address public steward;

    struct IntegrityEntry {
        string binID; // "Marby SF-Bin-001"
        string transportIssue; // "Roller resistance", "Misalignment", "Rust"
        string inspectionMethod; // "Weekly audit", "Worker feedback", "Scrollchain checklist"
        string emotionalTag;
        bool inspected;
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

    function inspectBin(string memory binID, string memory transportIssue, string memory inspectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(IntegrityEntry(binID, transportIssue, inspectionMethod, emotionalTag, true, false));
    }

    function sealIntegrityEntry(uint256 index) external onlySteward {
        require(entries[index].inspected, "Must be inspected first");
        entries[index].sealed = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
