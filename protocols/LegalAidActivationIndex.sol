// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegalAidActivationIndex {
    address public steward;

    struct AidEntry {
        string seafarerID;
        string aidType; // "Consular assistance", "Legal counsel", "Human rights audit"
        string activationStatus; // "Requested", "In progress", "Completed"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    AidEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateAid(string memory seafarerID, string memory aidType, string memory activationStatus, string memory emotionalTag) external onlySteward {
        entries.push(AidEntry(seafarerID, aidType, activationStatus, emotionalTag, true, false));
    }

    function sealAidEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getAidEntry(uint256 index) external view returns (AidEntry memory) {
        return entries[index];
    }
}
