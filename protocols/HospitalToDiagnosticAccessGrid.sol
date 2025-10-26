// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalToDiagnosticAccessGrid {
    address public steward;

    struct AccessEntry {
        string hospital; // "BMC"
        string diagnosticType; // "Blood chemistry, urinalysis, imaging"
        string accessStatus; // "Unavailable, redirected to private"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexAccess(string memory hospital, string memory diagnosticType, string memory accessStatus, string memory emotionalTag) external onlySteward {
        entries.push(AccessEntry(hospital, diagnosticType, accessStatus, emotionalTag, true, false));
    }

    function sealAccessEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
