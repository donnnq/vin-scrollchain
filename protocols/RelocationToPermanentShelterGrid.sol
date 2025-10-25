// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RelocationToPermanentShelterGrid {
    address public steward;

    struct ShelterEntry {
        string familyID; // "Catmon-Family-001"
        string shelterType; // "Socialized housing", "Community-built units", "Scrollchain-funded relocation"
        string dignitySignal; // "Permanent safety", "Scrollchain verified", "Community consent"
        string emotionalTag;
        bool housed;
        bool sealed;
    }

    ShelterEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function houseFamily(string memory familyID, string memory shelterType, string memory dignitySignal, string memory emotionalTag) external onlySteward {
        entries.push(ShelterEntry(familyID, shelterType, dignitySignal, emotionalTag, true, false));
    }

    function sealShelterEntry(uint256 index) external onlySteward {
        require(entries[index].housed, "Must be housed first");
        entries[index].sealed = true;
    }

    function getShelterEntry(uint256 index) external view returns (ShelterEntry memory) {
        return entries[index];
    }
}
