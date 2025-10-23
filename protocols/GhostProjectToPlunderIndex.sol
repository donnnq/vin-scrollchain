// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectToPlunderIndex {
    address public steward;

    struct PlunderEntry {
        string projectName; // "Flood control Phase 2"
        string region; // "Bulacan", "Tarlac"
        string implicatedOfficials; // "Congressman", "Vice Mayor", "DPWH Engineer"
        string plunderStatus; // "Under investigation", "For filing", "Trial-ready"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    PlunderEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexPlunder(string memory projectName, string memory region, string memory implicatedOfficials, string memory plunderStatus, string memory emotionalTag) external onlySteward {
        entries.push(PlunderEntry(projectName, region, implicatedOfficials, plunderStatus, emotionalTag, true, false));
    }

    function sealPlunderEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getPlunderEntry(uint256 index) external view returns (PlunderEntry memory) {
        return entries[index];
    }
}
