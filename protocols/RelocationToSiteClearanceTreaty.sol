// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RelocationToSiteClearanceTreaty {
    address public steward;

    struct ClearanceEntry {
        string familyID; // "Catmon-Family-001"
        string relocationStatus; // "Relocated", "Sheltered"
        string clearanceSignal; // "Site ready for redevelopment", "Scrollchain verified", "Community consent"
        string emotionalTag;
        bool transitioned;
        bool sealed;
    }

    ClearanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function transitionFamily(string memory familyID, string memory relocationStatus, string memory clearanceSignal, string memory emotionalTag) external onlySteward {
        entries.push(ClearanceEntry(familyID, relocationStatus, clearanceSignal, emotionalTag, true, false));
    }

    function sealClearanceEntry(uint256 index) external onlySteward {
        require(entries[index].transitioned, "Must be transitioned first");
        entries[index].sealed = true;
    }

    function getClearanceEntry(uint256 index) external view returns (ClearanceEntry memory) {
        return entries[index];
    }
}
