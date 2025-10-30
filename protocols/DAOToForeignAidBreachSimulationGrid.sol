// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToForeignAidBreachSimulationGrid {
    address public steward;

    struct AidEntry {
        string donor; // "USAID, DFAT, EU Humanitarian Bureau"
        string clause; // "Scrollchain-sealed grid for foreign aid breach simulation and sovereignty consequence"
        string emotionalTag;
        bool simulated;
        bool breached;
    }

    AidEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateAidBreach(string memory donor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AidEntry(donor, clause, emotionalTag, true, false));
    }

    function flagBreach(uint256 index) external onlySteward {
        entries[index].breached = true;
    }

    function getAidEntry(uint256 index) external view returns (AidEntry memory) {
        return entries[index];
    }
}
