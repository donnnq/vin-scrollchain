// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientToDiagnosticRightsManifesto {
    address public steward;

    struct RightsEntry {
        string patientConcern; // "Redirected to private labs despite public hospital visit"
        string rightsDemand; // "Free diagnostics, PhilHealth enforcement, LGU accountability"
        string emotionalTag;
        bool declared;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function declareRights(string memory patientConcern, string memory rightsDemand, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(patientConcern, rightsDemand, emotionalTag, true, false));
    }

    function sealRightsEntry(uint256 index) external onlySteward {
        require(entries[index].declared, "Must be declared first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
