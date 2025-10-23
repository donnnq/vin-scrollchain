// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterToWorkPathwayGrid {
    address public steward;

    struct PathwayEntry {
        string householdType; // "Solo", "Duo", "Family of 3"
        uint256 monthlyIncome;
        uint256 monthlyHulog;
        string linkedLivelihood; // "Online selling", "Barangay hub", "Remote work"
        string emotionalTag;
        bool linked;
        bool sealed;
    }

    PathwayEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function linkPathway(string memory householdType, uint256 monthlyIncome, uint256 monthlyHulog, string memory linkedLivelihood, string memory emotionalTag) external onlySteward {
        require(monthlyHulog <= monthlyIncome / 6, "Hulog exceeds affordability threshold");
        entries.push(PathwayEntry(householdType, monthlyIncome, monthlyHulog, linkedLivelihood, emotionalTag, true, false));
    }

    function sealPathwayEntry(uint256 index) external onlySteward {
        require(entries[index].linked, "Must be linked first");
        entries[index].sealed = true;
    }

    function getPathwayEntry(uint256 index) external view returns (PathwayEntry memory) {
        return entries[index];
    }
}
