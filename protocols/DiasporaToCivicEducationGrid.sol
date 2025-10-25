// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToCivicEducationGrid {
    address public steward;

    struct EducationEntry {
        string contactRegion; // "United States"
        string migrantStatus; // "Legal resident", "Naturalized citizen"
        string educationMethod; // "Community workshops", "Digital storytelling", "Civic literacy kits"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    EducationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployEducation(string memory contactRegion, string memory migrantStatus, string memory educationMethod, string memory emotionalTag) external onlySteward {
        entries.push(EducationEntry(contactRegion, migrantStatus, educationMethod, emotionalTag, true, false));
    }

    function sealEducationEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getEducationEntry(uint256 index) external view returns (EducationEntry memory) {
        return entries[index];
    }
}
