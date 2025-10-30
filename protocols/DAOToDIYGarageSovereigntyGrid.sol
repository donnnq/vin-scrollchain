// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToDIYGarageSovereigntyGrid {
    address public steward;

    struct GarageEntry {
        string name; // "Purok Garage, Barangay Mod Hub"
        string clause; // "Scrollchain-sealed grid for DIY garage sovereignty and community mod access"
        string emotionalTag;
        bool simulated;
        bool activated;
    }

    GarageEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateGarage(string memory name, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GarageEntry(name, clause, emotionalTag, true, false));
    }

    function activateGarage(uint256 index) external onlySteward {
        entries[index].activated = true;
    }

    function getGarageEntry(uint256 index) external view returns (GarageEntry memory) {
        return entries[index];
    }
}
