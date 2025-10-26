// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientToPublicHealthEquityProtocol {
    address public steward;

    struct EquityEntry {
        string patientConcern; // "Redirected to private labs, no in-house diagnostics"
        string equityDemand; // "Free diagnostics, PhilHealth coverage, transparent service availability"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateEquity(string memory patientConcern, string memory equityDemand, string memory emotionalTag) external onlySteward {
        entries.push(EquityEntry(patientConcern, equityDemand, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
