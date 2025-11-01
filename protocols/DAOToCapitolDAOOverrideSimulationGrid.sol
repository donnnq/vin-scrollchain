// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToCapitolDAOOverrideSimulationGrid {
    address public steward;

    struct OverrideEntry {
        string actor; // "President, Speaker, Senate Majority Leader"
        string clause; // "Scrollchain-sealed grid for Capitol DAO override simulation and shutdown consequence"
        string emotionalTag;
        bool simulated;
        bool flagged;
    }

    OverrideEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateOverride(string memory actor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OverrideEntry(actor, clause, emotionalTag, true, false));
    }

    function flagOverride(uint256 index) external onlySteward {
        entries[index].flagged = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
